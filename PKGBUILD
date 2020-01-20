#Contributor: Leon <leon.tty1@gmail.com>

pkgname=b1freearchiver
pkgdesc="Most friendly and simple free file archiver"
pkgver=1.5.86.4890
pkgrel=2
arch=('i686' 'x86_64')
depends=(qtwebkit)
optdepends=('python: dolphin service menu support')
url="http://www.b1.org"
license=('custom')
options=(strip)
install=$pkgname.install

case "$CARCH" in
	'i686')
		_arch1=32
		_arch2=i386
		sha512sums=('4a89b11e2156f055fcc0b330b36c64b54116881a120934b785075aa0530b5a2158ac4d6cca1adb6589ca1d49cf35c6f02b23174e18beda039bb72f27271379ec')
		;;
	'x86_64')
		_arch1=64
		_arch2=amd64
		sha512sums=('fab9b87f4e0b949c0edadcba0d6ef3ae7b4bd6b72ec2ed3b90fedb1dc9a83e0b648f76f271c04f51780ab30b74c8b6cdb9cbe9446baa058730737b26fa65ed49')
		;;
esac    

source=("http://b1.org/download-start/0/os=deb${_arch1}/b1freearchiver_current_stable_${_arch2}.deb")


package() {
	cd "$srcdir"
	tar zxpf data.tar.gz -C "$pkgdir"
	mv "$pkgdir"/usr/bin/b1-kde/* "$pkgdir/usr/lib/$pkgname/"
	rmdir "$pkgdir"/usr/bin/b1-kde
	chmod a+x "$pkgdir"/usr/lib/$pkgname/*

	# These python scripts are total mess, I rewrote them.
	patch "$pkgdir"/usr/lib/b1freearchiver/AddToArchive <<'_EOF_'
--- AddToArchive    2014-02-15 00:23:46.000000000 +0800
+++ AddToArchive    2016-05-08 23:18:23.265395809 +0800
@@ -3,26 +3,30 @@
 import sys
 import os
 import os.path
+import subprocess as subp
+import tempfile
 
 if __name__ == "__main__":
   if len(sys.argv) < 2:
-    print "Error: invalid arguments."
+    sys.stderr.write("Error: invalid arguments."+os.linesep)
     sys.exit(1)
   
-  os.system("rm -f /tmp/b1.lst")
+  with tempfile.NamedTemporaryFile('w+') as w:
+    for f in sys.argv[1: len(sys.argv)]:
+      w.write(f)
+      w.write(os.linesep)
+      w.flush()
   
-  f = file("/tmp/b1.lst",'a')
-  for str in sys.argv[1: len(sys.argv)]:
-    f.write(str)
-    f.write("\n")
-  f.close()
-  
-  real_dir = os.path.dirname(str)
-  command_line = "b1manager a "
-  command_line += "\"*" + os.path.basename(real_dir) + ".zip\" "
-  command_line += "\"@/tmp/b1.lst\""
-  
-  print command_line
-  os.chdir(real_dir)
-  os.system(command_line);
-  sys.exit(0)
+    real_dir = os.path.dirname(os.path.abspath(sys.argv[-1]))
+    if len(sys.argv) == 2:
+        outname = os.path.splitext(sys.argv[1])[0]
+    else:
+        outname = real_dir
+    command_line = ['b1manager','a',
+              '*{}.zip'.format(os.path.basename(outname)),
+              '@{}'.format(w.name)]
+      
+    #print(command_line)
+    os.chdir(real_dir)
+    ret = subp.call(command_line)
+  sys.exit(ret)
_EOF_

	patch "$pkgdir"/usr/lib/b1freearchiver/ExtractTo <<'_EOF_'
--- ExtractTo   2014-02-15 00:23:46.000000000 +0800
+++ ExtractTo   2016-05-08 23:29:22.584108648 +0800
@@ -3,20 +3,18 @@
 import sys
 import os
 import os.path
+import subprocess as subp
 
 def extaract_file(filename):
-  command_line = "b1manager x "
-  command_line += "\"" + filename + "\" "
-  command_line += "\"*" + os.path.dirname(filename) + "\""
-  print command_line
-  os.system(command_line)
+  command_line = ["b1manager", "x", filename,
+          "*{}".format(os.path.dirname(os.path.abspath(filename)))]
+  subp.call(command_line)
   
 if __name__ == "__main__":
   if len(sys.argv) < 2:
-    print "Error: invalid arguments."
+    sys.stderr.write("Error: invalid arguments.")
+    sys.stderr.write(os.linesep)
     sys.exit(1)
 
-  for str in sys.argv[1: len(sys.argv)]:
-    extaract_file(str)
-    
-  sys.exit(0)
+  for f in sys.argv[1: len(sys.argv)]:
+    extaract_file(f)
_EOF_

	patch "$pkgdir"/usr/lib/b1freearchiver/ExtractHere <<'_EOF_'
--- ExtractHere 2014-02-15 00:23:46.000000000 +0800
+++ ExtractHere 2016-05-08 23:30:55.405958018 +0800
@@ -3,20 +3,17 @@
 import sys
 import os
 import os.path
+import subprocess as subp
 
 def extaract_file(filename):
-  command_line = "b1manager x "
-  command_line += "\"" + filename + "\" "
-  command_line += "\"" + os.path.dirname(filename) + "\""
-  print command_line
-  os.system(command_line)
+  command_line = ["b1manager","x",filename,os.path.dirname(os.path.abspath(filename))]
+  subp.call(command_line)
   
 if __name__ == "__main__":
   if len(sys.argv) < 2:
-    print "Error: invalid arguments."
+    sys.stderr.write("Error: invalid arguments.")
+    sys.stderr.write(os.linesep)
     sys.exit(1)
 
-  for str in sys.argv[1: len(sys.argv)]:
-    extaract_file(str)
-    
-  sys.exit(0)
+  for f in sys.argv[1: len(sys.argv)]:
+    extaract_file(f)
_EOF_

	sed -i 's:Exec=/usr/bin/b1/:Exec=/usr/lib/'$pkgname'/:' \
	  "$pkgdir"/usr/share/kde4/services/*.desktop
	find "$pkgdir" -type d -print0 | xargs -0 chmod 755
}
