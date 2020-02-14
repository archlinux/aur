# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=swabiancoin
_pkgname_source=SwabianCoin
pkgver=20.02.01
pkgrel=1
pkgdesc="SwabianCoin (SCN) is yet another cryptocurrency"
arch=('x86_64')
url="https://www.swabiancoin.com"
license=('GPL3')
depends=('boost' 'openssl' 'curl' 'gflags')
makedepends=('cmake' 'gtest')
source=(https://github.com/SwabianCoin/SwabianCoin/archive/v$pkgver.tar.gz
	arch-linux-compat.diff)
sha256sums=('e01b7e100d847105da7fbef664a9d978ed279cc4a8d7855a8e818513b8ce5cbb'
            '90eaf6dfeba402f35e67f02a2c3fc3b4747994de748a07fc0598de1216b470b4')

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
