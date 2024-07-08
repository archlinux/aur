# Maintainer: Ruiqi Niu <rniu5 at jh dot edu>

pkgname=netgen-cgx
pkgver=6.2.2404
pkgrel=1
pkgdesc='`ng_vol` utility enabling Calculix CGX to mesh with Netgen.'
url=https://github.com/NGSolve/netgen
license=('LGPL2.1')
arch=('i686' 'x86_64')
makedepends=(
	'cmake'
	'gcc'
)
options=(
	'!buildflags'
	'!debug'
)
source=(
	"https://codeload.github.com/NGSolve/netgen/tar.gz/refs/tags/v$pkgver"
	'fix-building-without-python.patch'
	'ng_vol.cpp'
)
md5sums=(
	'0d1dd5b8858e35ed2564ec86703ff602'
	'c5602654983f6874e49d80e0fbdbd01f'
	'b7ffcdefaaa0c0b92937e8652a9c2351'
)

prepare() {
	cd $srcdir/netgen-$pkgver

	patch -p1 < $srcdir/fix-building-without-python.patch
}

build() {
	cd $srcdir/netgen-$pkgver
	mkdir -p build && cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DNG_INSTALL_DIR_LIB=lib/netgen \
		-DNG_INSTALL_DIR_INCLUDE=include/netgen \
		-DCMAKE_BUILD_TYPE=RELEASE \
		-DMETIS_DIR=/usr \
		-DUSE_GUI=OFF \
		-DUSE_PYTHON=OFF \
		-DBUILD_STUB_FILES=OFF \
		..
	make -j$(($(nproc) - 1))
	make DESTDIR=$srcdir/build install

	g++ -O3 -Wl,-rpath /usr/lib/$pkgname -L$srcdir/build/usr/lib/netgen -I$srcdir/build/usr/include/netgen -o $srcdir/build/ng_vol $srcdir/ng_vol.cpp -lnglib
}

package() {
	install -Dm755 $srcdir/build/ng_vol $pkgdir/usr/bin/ng_vol
	install -Dm755 $srcdir/build/usr/lib/netgen/libnglib.so $pkgdir/usr/lib/$pkgname/libnglib.so
	install -Dm755 $srcdir/build/usr/lib/netgen/libngcore.so $pkgdir/usr/lib/$pkgname/libngcore.so
}

