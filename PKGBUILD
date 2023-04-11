# Maintainer: Paul Hentschel (hpmachining)

pkgname=cbang
pkgver=1.3.1
pkgrel=5
pkgdesc="a library of cross-platform C++ utilities"
arch=('x86_64')
url="https://github.com/CauldronDevelopmentLLC/cbang"
license=('LGPL2.1')
depends=(
  'v8-3.14'
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
  'python2'
)
optdepends=(
  'mariadb-libs: MariaDB database support'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/CauldronDevelopmentLLC/cbang/archive/$pkgver.tar.gz"
  "0001_python3_fix.patch"
  "0002_openssl_test.patch"
)
sha256sums=('23bf2997ac8438592545f1cde7cd076ba759f3f4a01e6540cdf45a97616eaaef'
            '4047b8dcaeae671d631e4cfbc896833c861ecf1a1e1c3d873095d901515f7e11'
            '254d6e33e1a53eb5edc80f0a4a660232562b79b8fec46ffccf12fbdb4b3836e3')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "../0001_python3_fix.patch"
	patch -p1 -i "../0002_openssl_test.patch"
}

build() {
  cd "$pkgname-$pkgver"
  scons disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat" \
        cxxflags="-fpermissive" \
        with_openssl=false
}

check() {
  cd "$pkgname-$pkgver/tests"
  scons
  python2 ./testHarness
}

package() {
  cd "$pkgname-$pkgver"
  scons install prefix="$pkgdir/opt/$pkgname" \
        disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat" \
        cxxflags="-fpermissive" \
        with_openssl=false
  install -m644 lib/libcbang.a -t "$pkgdir/opt/$pkgname/lib"
  install -m644 lib/libcbang-boost.a -t "$pkgdir/opt/$pkgname/lib"
  cp -a config/ "$pkgdir/opt/$pkgname/config/"
  cp -a src/boost/boost/ "$pkgdir/opt/$pkgname/include/"
}
