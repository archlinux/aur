# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=swabiancoin
_pkgname_source=SwabianCoin
pkgver=20.02.03
pkgrel=1
pkgdesc="SwabianCoin (SCN) is yet another cryptocurrency"
arch=('x86_64')
url="https://www.swabiancoin.com"
license=('GPL3')
depends=('boost' 'openssl' 'curl' 'gflags')
makedepends=('cmake' 'gtest')
source=(https://github.com/SwabianCoin/SwabianCoin/archive/v$pkgver.tar.gz
	arch-linux-compat.diff)
sha256sums=('fbd9dc4debfd5fa3d815dd8594dbe5063b87c9f9073553c310cf345597f59ea5'
            'f09b58c15426cc76ae26e5f88c01ff4b32ac2e7e1247dd06328f0b1c60e88167')

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
	mv "$pkgdir/usr/bin/full_node_cli" "$pkgdir/usr/bin/scn_full_node_cli"
	mv "$srcdir/$_pkgname_source-$pkgver/build/runTests" "$pkgdir/usr/bin/scn_run_tests"
	rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/share" 
}
