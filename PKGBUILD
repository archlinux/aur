# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=uclibc-ng
pkgver=1.0.31
pkgrel=1
epoch=
pkgdesc="A C library for embedded Linux"
arch=(x86_64)
url="https://uclibc-ng.org/"
license=('LGPL2.1')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('staticlibs')
install=
changelog=
source=(
	"https://downloads.uclibc-ng.org/releases/$pkgver/uClibc-ng-$pkgver.tar.xz"
	"config"
)
noextract=()
sha512sums=('4103287a2861429f476ea4a5534cc291017bf237e9224d47285de05c83bcb58efc1be51985ab2f3e4cf73f43c1429190908ed7a4567c3f2248f4bd5a38d5d1ed'
            '0318e67ead594929f54dec56377465fe1877a996d81c0bfbc4537745fb8a54bbdeaca8b43fb1a3196dc4ab9e680cc787aa8599fd11dcf28808d404fd61b65fda')

prepare() {
	cd "uClibc-ng-$pkgver"
	cp "$srcdir"/config .config
}

build() {
	cd "uClibc-ng-$pkgver"
	make all
}

package() {
	cd "uClibc-ng-$pkgver"
	make V=1 PREFIX="$pkgdir" install

	# configure RUNTIME_PREFIX with /lib for PT_INTERP compat, but install to /usr/lib
	mv "$pkgdir"/lib/ld64-uClibc*.so* "$pkgdir"/usr/lib/
	mv "$pkgdir"/lib/* "$pkgdir"/usr/lib/uClibc/lib/
	rmdir "$pkgdir"/lib
}
