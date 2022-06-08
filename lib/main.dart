// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic List View',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final List<Widget> _listtile = [];

  TextEditingController nameController=TextEditingController();
  // TextEditingController emailController=TextEditingController();
  TextEditingController contactController=TextEditingController();
   
   //to clear the textfields
   void clear(){
     nameController.clear();
    //  emailController.clear();
     contactController.clear();
   }

  //
  void _addCardWidget() {
    setState(() {
      _listtile.add(listTile());
    });
  }
  
  void _removeCardWidget(){
    setState(() {
      _listtile.remove(listTile());
    });
  }
  
  //Main home page contains contactlist
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact List')),
      body:Center(
        child:ListView.builder(
          itemCount:_listtile.length,
          itemBuilder:(context,index){
            return _listtile[index];
          } ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialogBox(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //DialogBox
  _dialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Add details'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textfield('Name',nameController),
                  // textfield('Email',emailController),
                  textfield('Contactno',contactController),
                  button()
                ],
              ));
        });
  }

  //listtile of the homepage
  Widget listTile() {
      return ListTile(
        title: Text(nameController.text),
        subtitle: Text(contactController.text),
        trailing: IconButton(
          onPressed: () {
            _removeCardWidget();
          }, 
          icon: const Icon(Icons.delete)),
        // trailing: Text(contactController.text),
        // trailing:Row(
        //   children: [
        //     Text(contactController.text),
        //     IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        //   ]),
      );  
  }

  //textfield of dialogbox
  Widget textfield(String hintname,TextEditingController mycontroller) {
    return TextField(
      controller: mycontroller,
      decoration: InputDecoration(hintText: hintname),
    );
  }

  //button of dialogbox
  Widget button() {
    return RaisedButton(
      onPressed: () {
        _addCardWidget();
        clear();
        Navigator.pop(context);
      },
      child: const Text('Add'),
      color: Colors.blue,
    );
  }
}
