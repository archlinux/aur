# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=ffmpegyag
pkgver=0.7.6
pkgrel=1
epoch=
pkgdesc="Simple FFmpeg GUI for Linux & Windows"
arch=("i686" "x86_64")
url="https://sourceforge.net/projects/ffmpegyag"
license=('MIT')
groups=()
depends=("ffmpeg" "wxgtk")
makedepends=(gcc grep findutils make coreutils)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_short="${pkgname}_${pkgver}_src"
source=("http://downloads.sourceforge.net/project/$pkgname/${_short}.tar.gz")
noextract=()
md5sums=("d0191a0bcc0d0ace20a5cc6acda1bef9")
validpgpkeys=()

prepare() {
	cd "$_short"
    patch -p2 <<EOF
diff -ruBb ../ffmpegyag_orig/src/Libav.cpp ./src/Libav.cpp
--- ../ffmpegyag_orig/src/Libav.cpp	2016-02-14 01:53:12.876667983 +0100
+++ ./src/Libav.cpp	2016-02-14 02:01:07.688583768 +0100
@@ -30,7 +30,7 @@
     // remove ffmpegyag itself from the list
     for(long f=0; f<(long)ConverterFiles.GetCount(); f++)
     {
-        if(ConverterFiles[f].IsSameAs(ConverterApplication.GetFullPath()))
+        if(ConverterFiles[f].EndsWith(wxT("ffmpegthumbnailer")) || ConverterFiles[f].IsSameAs(ConverterApplication.GetFullPath()))
         {
             ConverterFiles.RemoveAt(f);
             f--;
@@ -52,7 +52,11 @@
             // remove ffmpegyag itself from the list
             for(long f=0; f<(long)ConverterFiles.GetCount(); f++)
             {
-                if(ConverterFiles[f].AfterLast(wxFileName::GetPathSeparator()).IsSameAs(ConverterApplication.GetFullName()))
+                if(
+                        ConverterFiles[f].AfterLast(wxFileName::GetPathSeparator()).IsSameAs(ConverterApplication.GetFullName())
+                        || 
+                        ConverterFiles[f].AfterLast(wxFileName::GetPathSeparator()).EndsWith(wxT("ffmpegthumbnailer"))
+                  )
                 {
                     ConverterFiles.RemoveAt(f);
                     f--;

EOF
}

build() {
	cd "$_short"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_short"
	make DESTDIR="$pkgdir/" install
}

