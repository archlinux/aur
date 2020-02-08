# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=swabiancoin
_pkgname_source=SwabianCoin
pkgver=20.01.02
pkgrel=1
pkgdesc="SwabianCoin (SCN) is yet another cryptocurrency"
arch=('x86_64')
url="https://www.swabiancoin.com"
license=('GPL3')
depends=('boost' 'openssl' 'curl' 'gflags')
checkdepends=('gtest')
source=(https://github.com/SwabianCoin/SwabianCoin/archive/v$pkgver.tar.gz
	arch-linux-compat.diff)
sha256sums=('7fa0529bf9318039e871cb8efcf3e9932ff28db916f2855db7a78e92b0b550ff'
	    '26bf80450607783c315d8c41eb3e2d578009f42af736c0f36fdc77da356c3e2d')

prepare() {
  cd $_pkgname_source-$pkgver
  patch --forward --strip=1 --input="../arch-linux-compat.diff"
}

build() {
	cd $_pkgname_source-$pkgver
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
		 -DCMAKE_BUILD_TYPE=Release \
		 -DBUILD_UNIT_TESTS=ON
	make
}

check() {
    cd $_pkgname_source-$pkgver/build
    ./runTests
}

package() {
	cd $_pkgname_source-$pkgver/build
	DESTDIR="$pkgdir" make install
	mv "$pkgdir/usr/bin/full_node_cli" "$pkgdir/usr/bin/snc_full_node_cli"
	rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/share" 
}
