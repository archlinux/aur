# Maintainer:  dreieck
# Contributor: flan_suse

# This package does not compile the GTK1 version.
# It only compiles and builds the CLI and GTK2 versions.
# This means:
#        * fewer makedeps to pull in
#        * shorter compile time
#        * smaller package size

# Ignore the warning of:
# WARNING: Package contains reference to $srcdir
# This also happens with unison in the [extra] repo.
# Compiling it includes the $srcdir path in the binary.

# If you wish to install this side-by-side with other versions, see comments below.

pkgname=unison-232-compat
_pkgname=unison
pkgver=2.32.52
_pkgver=232
pkgrel=1
pkgdesc="File-synchronization tool (legacy 2.32 version). Compatible with parallel installation to other versions of unison binaries (but pay attention to the local user configurations!)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.cis.upenn.edu/~bcpierce/unison"
provides=("unison-232=${pkgver}")
optdepends=('gtk2: for the GTK2 frontend')
makedepends=('ocaml' 'lablgtk2' 'imagemagick' 'gtk2')
source=("http://www.cis.upenn.edu/~bcpierce/$_pkgname/download/releases/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz"
        "$_pkgname-ssh-ocaml.patch"
        "$_pkgname-$_pkgver.desktop")
md5sums=('0701f095c1721776a0454b94607eda48'
         '81a28349471434c75a4206d07ad21eb1'
         '2ab7bb57623e786936d892ddc228c2f8')
options=(!makeflags)
# Comment out the very last 2 lines if you want to install
# side-by-side with other versions.

build() {
  # Move into the source directory
  cd $srcdir/$_pkgname-$pkgver
  CFLAGS=""


  # Apply SSH Ocaml patch
  patch -Np1 -i "../$_pkgname-ssh-ocaml.patch"

  # Compile Unison 2.32 command-line version
  make clean
  make mkProjectInfo
  make UISTYLE=text DEBUGGING=false THREADS=true
  mv "$_pkgname" "$_pkgname-cli"

  # Compile Unison 2.32 GTK2 graphical version
  make clean
  make mkProjectInfo
  make UISTYLE=gtk2 DEBUGGING=false THREADS=true
  mv "$_pkgname" "$_pkgname-gtk2"

  # Create a .png icon to be used in the menu
  convert "win32rc/U.ico" "$_pkgname-$_pkgver.png"

}

package() {

  # Move into the source directory
  cd $srcdir/$_pkgname-$pkgver

  # Install the compiled binary files
  install -Dm755 "$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-$_pkgver"
  install -Dm755 "$_pkgname-gtk2" "$pkgdir/usr/bin/$_pkgname-$_pkgver-gtk2"

  # Install the icon to be used with the menu
  install -Dm644 "$_pkgname-$_pkgver-3.png" "$pkgdir/usr/share/pixmaps/$_pkgname-$_pkgver.png"

  # Install the .desktop menu file, which can launch the GTK2 version
  install -Dm644 "../$_pkgname-$_pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname-$_pkgver.desktop"
  
  # Make a symbolic link named "unison-232-x11" that points to "unison-232-gtk2"; not required, but good for scripting / compatibility reasons
  cd "$pkgdir/usr/bin/"
  ln -s "$_pkgname-$_pkgver-gtk2" "$_pkgname-$_pkgver-x11"

  # Make a symbolic link named "unison" to overcome some server compatibility issues
  # Comment out the next 2 lines if you wish to install this side-by-side with other versions
  #cd "$pkgdir/usr/bin/"
  #ln -s $_pkgname-$_pkgver $_pkgname

}
