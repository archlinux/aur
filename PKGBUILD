# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Faule Socke <github@socker.lepus.uberspace.de>

pkgname=frida
pkgver=0.2
pkgrel=2
pkgdesc="an interactive disassembler based on LLVM and Qt"
arch=(x86_64)
url='https://www.frida.xyz'
license=(GPL3)
depends=(boost
         gmock
         guile
         libedit
         llvm35
         log4cxx
         quazip
         swig)
makedepends=(cmake)
source=("$url/download/$pkgname-$pkgver.txz"
        "$pkgname.patch")
sha256sums=('82c3cc53db26dc658e855b6ba4593dd4deb2c947f2ee1784aef90dd559e269de'
            '852947bce88c1847b397806d5f13d69505eb8781f939de689f0eee976c8a7693')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < "$pkgname.patch"
}

build() {
	cd "$pkgname-$pkgver"
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQUAZIP_INCLUDE_DIR=/usr/include \
		-DQUAZIP_LIBRARIES=/usr/lib/libquazip5.so
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
}
