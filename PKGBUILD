# Maintainer: Paul Hentschel (hpmachining)
# Contributor: greyltc

pkgname=cbang-git
pkgver=r1345.38c036a1
pkgrel=1
pkgdesc="A library of cross-platform C++ utilities"
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
  'git'
  'scons'
)
checkdepends=(
  'python2'
  'python2-six'
)
optdepends=(
  'mariadb-libs: MariaDB database support'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+https://github.com/CauldronDevelopmentLLC/cbang.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  scons cxxstd="c++14" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
}

check() {
  cd "${pkgname%-git}/tests"
  scons
  python2 ./testHarness
}

package() {
  cd "${pkgname%-git}"
  scons install cxxstd="c++14" prefix="$pkgdir/opt/${pkgname%-git}"
  install -m644 lib/libcbang.a -t "$pkgdir/opt/${pkgname%-git}/lib" 
  install -m644 lib/libcbang-boost.a -t "$pkgdir/opt/${pkgname%-git}/lib" 
  cp -a config/ "$pkgdir/opt/${pkgname%-git}/config/"
  cp -a src/boost/boost/ "$pkgdir/opt/${pkgname%-git}/include/"
  cp -a include/cbang/ "$pkgdir/opt/${pkgname%-git}/include/"
}
