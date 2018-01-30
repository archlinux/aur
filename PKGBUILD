# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=n64-toolchain-git
pkgver=20180108
pkgrel=1
arch=('x86_64' 'mips64')
pkgdesc="N64 developement tools."
url="https://github.com/glankk/n64"
source=("git+https://github.com/glankk/n64.git")
makedepends=('git' 'lib32-glibc')
depends=('lib32-jansson' 'lib32-lua' 'lib32-libusb')
conflicts=('n64-toolchain')
provides=('n64-toolchain')
sha512sums=('SKIP')
options=('!buildflags' '!strip')

pkgver() {
  # Identify latest version.
  cd "$srcdir/n64"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  # Configure the package.
  cd $srcdir/n64
  ./configure
}

build() {
  # cd to source directory.
  cd $srcdir/n64

  # Fix the makefiles, as Arch Linux uses -llua, not -llua5.3.
  find . -name "makefile" -exec sed -i.bak "s/-llua5.3/-llua/g" '{}' \;

  # Build with 32-bit ABI.
  export PATH=/opt/n64-dev/usr/bin:$PATH
  make CFLAGS="-m32"
}

package() {
  # Install the binaries that the makefile generates.
  cd $srcdir/n64
  make INSTALLDIR=$pkgdir/opt/n64-dev/usr/bin install

  # Install what will be the sysroot of the n64 architecture.
  mkdir -p $pkgdir/opt/n64-dev/n64-sysroot
  cp -r $srcdir/n64/include $pkgdir/opt/n64-dev/n64-sysroot/
  cp -r $srcdir/n64/lib     $pkgdir/opt/n64-dev/n64-sysroot/
}