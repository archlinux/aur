# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

# Contributor: Aaron Lindsay <aaron@aclindsay.com>

# Name of the Software your PKGBUILD will install - should be unique. See PKGBUILD#pkgname
pkgname=libsearpc

# The version number for the software
pkgver=1.2.2
_seafilever=3.0-latest

#The release number for the arch package, as fixes are added to the PKGBUILD, the release number will increase
pkgrel=8

# The description of the package, should be about 80 characters long (one line)
pkgdesc="A simple and easy-to-use C language RPC framework (including both server side & client side) based on GObject System."

# The type of processor this software can build and work on. See PKGBUILD#arch
arch=('i686' 'x86_64' 'armv6h' 'armv7h')

# The official website for the software your PKGBUILD will install
url="https://github.com/haiwen/libsearpc/"

# The License that the software is released under. See PKGBUILD#license
license=('GPLv3')

# Packages that your software needs to run. If the dependancy requires a minimum version number use the >= operator
depends=('glib2>=2.16.0' 'pacman>=4.1' 'jansson>=2.2.1' 'libtool>=1.4')

# Packages that must be installed to build the software, but at not necessary to run it
makedepends=()

# Optional packages that extend the software's functionality
optdepends=('python2-simplejson')

# List of Package names that this PKGBUILD provides. Put modified packages that will be installed here.
provides=()

# Change the default behavior of makepkg see PKGBUILD#options
options=()

source=("https://github.com/haiwen/libsearpc/archive/v${_seafilever}.tar.gz"
	"libsearpc.pc.patch")

configure_libsearpc() {
	./autogen.sh
	./configure --prefix=/usr PYTHON=/usr/bin/python2
}

pkgver() {
	cd "$srcdir/$pkgname-$_seafilever"
	configure_libsearpc &> /dev/null
	grep "PACKAGE_VERSION" Makefile | sed 's/PACKAGE_VERSION.*=[ \t]\+\([0-9\.]\+\)[ \t]*/\1/g'
}

prepare () {
	pkgver
	cd "$srcdir/$pkgname-$_seafilever"
	patch -p1 -i $srcdir/libsearpc.pc.patch 
}

build () {
	cd "$srcdir/$pkgname-$_seafilever"
	configure_libsearpc
	make -j1
}

package () {
	#install library and header files
	cd "$srcdir/$pkgname-$_seafilever"
	make DESTDIR="$pkgdir/" install
}
sha256sums=('56313771e0ad7dc075c4590b6a75daeb3939937b21716d82c91be2612133b8cd'
            'aec39a303aaebc0777a22d8c53367f52f619654d63f62b362d75c1c599e632f4')
