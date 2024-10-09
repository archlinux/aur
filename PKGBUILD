# Maintainer: Paul Hentschel (hpmachining)

pkgname=cbang
pkgver=1.8.0
pkgrel=5
pkgdesc="a library of cross-platform C++ utilities"
arch=('x86_64')
url="https://github.com/CauldronDevelopmentLLC/cbang"
license=('LGPL2.1')
depends=(
  'v8-r'
  'libevent'
  'sqlite'
  're2'
  'libyaml'
  'zlib'
  'bzip2'
  'expat'
)
makedepends=(
  'scons'
)
checkdepends=(
  'python'
  'python-six'
)
optdepends=(
  'mariadb-libs: MariaDB database support'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/CauldronDevelopmentLLC/cbang/archive/refs/tags/$pkgver.tar.gz"
  "0001_v8_sandbox_enable.patch"
  "0002_include_cstdint.patch"
  "0003_ScriptOrigin.patch"
  "0004_URI_contains.patch"
)
sha256sums=('4be28b0aa0d024e5c9fd274264bed7f82551219414c12c45e35afd8946f6e7d7'
            'b6bc2013fb3ac58daba7bab7b34cf1331ebd5a85da7947ef87feb09e6f6fe512'
            'a2e16d999e58856fe9885243235d711afc0b2260c0c0b346b59aa4b948209d5c'
            '664931b22afc7452e357e991a321fd35ffd49a06e8f1e33653e023cb02e2b5d0'
            '130c32e2e03cbec45a8969dc6bd2b7ea1e8e21518f39a6116041cb620140a37b')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "../0001_v8_sandbox_enable.patch"
	patch -p1 -i "../0002_include_cstdint.patch"
	patch -p1 -i "../0003_ScriptOrigin.patch"
	patch -p1 -i "../0004_URI_contains.patch"
}

build() {
  cd "$pkgname-$pkgver"
  scons cxxstd="c++20" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
}

check() {
  cd "$pkgname-$pkgver/tests"
  scons cxxstd="c++20" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
  python ./testHarness
}

package() {
  cd "$pkgname-$pkgver"
  scons install prefix="$pkgdir/opt/$pkgname" \
	cxxstd="c++20" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
  install -m644 lib/libcbang.a -t "$pkgdir/opt/$pkgname/lib"
  install -m644 lib/libcbang-boost.a -t "$pkgdir/opt/$pkgname/lib"
  cp -a config/ "$pkgdir/opt/$pkgname/config/"
  cp -a src/boost/boost/ "$pkgdir/opt/$pkgname/include/"
  cp -a include/cbang/ "$pkgdir/opt/$pkgname/include/"
}
