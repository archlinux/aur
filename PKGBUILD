# Maintainer: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

# Name of the Software your PKGBUILD will install - should be unique. See PKGBUILD#pkgname
pkgname=ccnet

# The version number for the software
pkgver=1.4.2
_seafilever=4.2.4

#The release number for the arch package, as fixes are added to the PKGBUILD, the release number will increase
pkgrel=11

# The description of the package, should be about 80 characters long (one line)
pkgdesc="A framework for writing networked applications in C."

# The type of processor this software can build and work on. See PKGBUILD#arch
arch=('i686' 'x86_64' 'armv7h' 'armv6h')

# The official website for the software your PKGBUILD will install
url="https://github.com/haiwen/ccnet/"

# The License that the software is released under. See PKGBUILD#license
license=('custom')

# Packages that your software needs to run. If the dependancy requires a minimum version number use the >= operator
depends=('libevent>=2.0' 'libzdb>=2.10.2' 'libsearpc>=1.2.2' 'jansson>=2.2.1' 'libldap' 'python2>=2.6')

# Packages that must be installed to build the software, but at not necessary to run it
makedepends=('vala>=0.8' 'pacman>=4.1')

# Optional packages that extend the software's functionality
optdepends=()

# List of Package names that this PKGBUILD provides. Put modified packages that will be installed here.
provides=()

# Change the default behavior of makepkg see PKGBUILD#options
options=()

source=("https://github.com/haiwen/ccnet/archive/v${_seafilever}.tar.gz"
	"https://raw.githubusercontent.com/haiwen/ccnet/master/COPYRIGHT"
	"libccnet.pc.patch"
	"0001-Add-autoconfiguration-for-libjansson.patch")

configure_ccnet() {
	./autogen.sh
	CFLAGS="-lpthread" ./configure --enable-server --enable-ldap --prefix=/usr PYTHON=/usr/bin/python2
}

pkgver() {
	cd "$srcdir/$pkgname-$_seafilever"
	configure_ccnet &> /dev/null
	grep "PACKAGE_VERSION" Makefile | sed 's/PACKAGE_VERSION.*=[ \t]\+\([0-9\.]\+\)[ \t]*/\1/g'
}

prepare () {
	cd "$srcdir/$pkgname-$_seafilever"
	patch -p1 -i $srcdir/libccnet.pc.patch
	patch -p1 -i $srcdir/0001-Add-autoconfiguration-for-libjansson.patch
}

build () {
	cd "$srcdir/$pkgname-$_seafilever"
	configure_ccnet
	make -j1
}

package () {
	#install library and header files
	cd "$srcdir/$pkgname-$_seafilever"
	make DESTDIR="$pkgdir/" install

	#copy license over
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp $srcdir/COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/
}
sha256sums=('49ebcfddbb2de2ec74faaaf9e6fd5f6104f05c2c477946706afa4f3ea24686f5'
            'c07aeccf581c255e60acbddcc6af90290e0d6354e6ec0ee1987b82845d3d57ac'
            '66c3b02c3981db6a80819e0ae103bedadf8dfdf81405a7f75a9cba714acf973f'
            '382b1da33e2b6c0ebab8d3921d92b7417fa11d969ad822cd43aee499fd7b3d94')
