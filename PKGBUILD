# Maintainer: Paul Hentschel (hpmachining)
# Contributor: greyltc

pkgname=cbang-git
pkgver=r1771.1b05ea96
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
  'python'
  'python-six'
)
optdepends=(
  'mariadb-libs: MariaDB database support'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
#_commit="58d2cb5cbce2e1d4e71cc7bbac65a49ddb6e40fe"
#source=("git+https://github.com/CauldronDevelopmentLLC/cbang.git#commit=$_commit"
source=("git+https://github.com/CauldronDevelopmentLLC/cbang.git"
		"0001_v8_sandbox_enable.patch")
sha256sums=('SKIP'
            '75eff0bcd04293990f8dfb0771562356ccac2a7f40a06df0c0ba515fcdf4126a')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  patch -p1 -i "../0001_v8_sandbox_enable.patch"
}

build() {
  cd "${pkgname%-git}"
  scons cxxstd="c++17" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
}

check() {
  cd "${pkgname%-git}/tests"
  scons cxxstd="c++17" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
  python ./testHarness
}

package() {
  cd "${pkgname%-git}"
  scons install cxxstd="c++17" prefix="$pkgdir/opt/${pkgname%-git}"
  install -m644 lib/libcbang.a -t "$pkgdir/opt/${pkgname%-git}/lib" 
  install -m644 lib/libcbang-boost.a -t "$pkgdir/opt/${pkgname%-git}/lib" 
  cp -a config/ "$pkgdir/opt/${pkgname%-git}/config/"
  cp -a src/boost/boost/ "$pkgdir/opt/${pkgname%-git}/include/"
  cp -a include/cbang/ "$pkgdir/opt/${pkgname%-git}/include/"
  cp -a include/event2/ "$pkgdir/opt/${pkgname%-git}/include/"
  cp -a include/lz4/ "$pkgdir/opt/${pkgname%-git}/include/"
  cp -a src/cbang/boost/ "$pkgdir/opt/${pkgname%-git}/include/cbang/"
}
