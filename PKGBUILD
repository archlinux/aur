# Maintainer: Paul Hentschel (hpmachining)
# Contributor: greyltc

pkgname=cbang-git
pkgver=r1511.ebab9fae
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
source=("git+https://github.com/CauldronDevelopmentLLC/cbang.git"
		"0001_v8_sandbox_enable.patch"
		"0002_include_cstdint.patch"
		"0003_include_cstdint.patch")
sha256sums=('SKIP'
            '75eff0bcd04293990f8dfb0771562356ccac2a7f40a06df0c0ba515fcdf4126a'
            '0137c007c7596cbd9d9f7194cd6e1aaf11819489c815c57b29b9873523d25cd7'
            '170101a781c105ed83225bfd0387348560d2dd89eede72de45fee60a6ba1a51a')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  patch -p1 -i "../0001_v8_sandbox_enable.patch"
  patch -p1 -i "../0002_include_cstdint.patch"
  patch -p1 -i "../0003_include_cstdint.patch"
}

build() {
  cd "${pkgname%-git}"
  scons cxxstd="c++17" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
}

check() {
  cd "${pkgname%-git}/tests"
  scons
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
}
