# Maintainer: Paul Hentschel (hpmachining)

pkgname=cbang
pkgver=1.8.0
pkgrel=1
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
)
sha256sums=('4be28b0aa0d024e5c9fd274264bed7f82551219414c12c45e35afd8946f6e7d7'
            '75eff0bcd04293990f8dfb0771562356ccac2a7f40a06df0c0ba515fcdf4126a')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "../0001_v8_sandbox_enable.patch"
}

build() {
  cd "$pkgname-$pkgver"
  scons cxxstd="c++17" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
}

check() {
  cd "$pkgname-$pkgver/tests"
  scons
  python ./testHarness
}

package() {
  cd "$pkgname-$pkgver"
  scons install prefix="$pkgdir/opt/$pkgname" \
	cxxstd="c++17" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
  install -m644 lib/libcbang.a -t "$pkgdir/opt/$pkgname/lib"
  install -m644 lib/libcbang-boost.a -t "$pkgdir/opt/$pkgname/lib"
  cp -a config/ "$pkgdir/opt/$pkgname/config/"
  cp -a src/boost/boost/ "$pkgdir/opt/$pkgname/include/"
  cp -a include/cbang/ "$pkgdir/opt/$pkgname/include/"
}
