using System;
using System.IO;

namespace ByteConv {
    public abstract class Program {
        public static void Main(string[] args) {
            string name = String.Join('_', String.Join('_', args[0].Split(' ')).Split('.'));
            string typeis = "string";
            if (args[1] == "binary") typeis = "byte";
            Console.Write(String.Concat("namespace AUR_Includes{\npublic class ", name, "{\npublic static ", typeis, "[] content=new ", typeis, "[]{"));
            if (args[1] == "text") {
                string[] content = File.ReadAllLines(args[0]);
                for (int x = 0; x < content.Length; x++) {
                    Console.Write(String.Concat("\"", String.Join("\\\"", content[x].Split('"')), "\","));
                }
            }
            else if (args[1] == "binary") {
                byte[] content = File.ReadAllBytes(args[0]);
                for (int x = 0; x < content.Length; x++) {
                    Console.Write(String.Concat(((int)content[x]).ToString(), ","));
                }
            }
            Console.WriteLine("};\n}\n}");
        }
    }
}