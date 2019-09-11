# Maintainer: Mikhail Glayutin <Mikhail.Galyutin@googlemail.com>
pkgname=fift
pkgver=0.5
pkgrel=2
epoch=
pkgdesc="TON Test Fift compiler and execution environment"
arch=('i686' 'x86_64')
url="https://test.ton.org/download.html"
license=('LGPL.v2')
groups=()
depends=('openssl' 'zlib' 'readline')
makedepends=('cmake>3.0.2' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://test.ton.org/ton-test-liteclient-full.tar.xz" "https://test.ton.org/fiftbase.pdf")
md5sums=('5883531eaf293e0278a65525195d39a4' '1297ddcfdc880c8ed563e7f5aaf10714')
noextract=()
validpgpkeys=()

prepare() {
	echo "patching to fix default library issue"
	patch lite-client/crypto/fift/fift-main.cpp < ../My1.patch
	patch lite-client/crypto/block/create-state.cpp < ../My2.patch
}

build() {
	mkdir build
	cd build
	cmake $srcdir/lite-client 
	cmake --build . --target fift
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp build/crypto/fift "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/fift"
	cp lite-client/crypto/fift/lib/* "$pkgdir/usr/lib/fift"
	mkdir -p "$pkgdir/usr/share/fift/doc"
	cp fiftbase.pdf "$pkgdir/usr/share/fift/doc"
	mkdir -p "$pkgdir/usr/share/fift/examples"
	cp lite-client/crypto/smartcont/* "$pkgdir/usr/share/fift/examples"
}
