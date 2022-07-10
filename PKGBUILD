# Maintainer: Jordan Rudess <jrudess@gmail.com>
pkgname=slang-verilog
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="SystemVerilog Language Services"
arch=('x86_64')
url="https://github.com/MikePopoloski/slang"
license=('MIT')
groups=()
depends=('fmt' 'xxhash' 'catch2')
makedepends=('python' 'cmake' 'gcc' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MikePopoloski/slang/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('8ea89d2727901717d3d5e81d97e6309e6d9a3af31c70d96bd50b26406edf5e48')
validpgpkeys=()

prepare() {
	rm -rf "$srcdir/slang-$pkgver/external/catch2"
	rm -rf "$srcdir/slang-$pkgver/external/fmt"
	rm -rf "$srcdir/slang-$pkgver/external/xxhash"
	mkdir -p "$srcdir/slang-$pkgver/build"
	patch -Np1 -i $srcdir/../slang-verilog.patch
}

build() {
	cd "$srcdir/slang-$pkgver/build"
	cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release -DxxHash_DIR=$srcdir/..  -DCMAKE_INSTALL_PREFIX=/usr -DSLANG_USE_SYSTEM_LIBS=True -DBUILD_SHARED_LIBS=True ..
	make VERBOSE=1
}

check() {
	cd "$srcdir/slang-$pkgver/build"
	ctest
}

package() {
	cd "$srcdir/slang-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
