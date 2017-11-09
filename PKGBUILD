# Maintainer: ajs124

pkgname=evdi-git
pkgver=1.5.0.r0.ge7a08d0
pkgrel=1
pkgdesc="A Linux® kernel module that enables management of multiple screens. Git version."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
depends=(dkms)
makedepends=(git libdrm)
install=$pkgname.install
changelog=$pkgname.Changelog
source=(git+https://github.com/DisplayLink/evdi/)
md5sums=(SKIP)
conflicts=(evdi)
provides=(evdi=$pkgver)

pkgver() {
	cd ${pkgname/-git/}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	# We only need to build the library in this step, dmks will build the module
	cd ${pkgname/-git/}/library
	make
}

package() {
	# Predfine some target folders
	SRCDIR="$pkgdir/usr/src/${pkgname/-git/}-$pkgver"	# This one is needed for dkms
	LIBNAME=lib${pkgname/-git/}

	cd ${pkgname/-git/}

	install -D -m 755 library/$LIBNAME.so $pkgdir/usr/lib/$LIBNAME.so

	install -d $SRCDIR
	install -D -m 755 module/* $SRCDIR
}
