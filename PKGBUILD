# Maintainer: Frank Villaro-Dixon <f@vi-di.fr>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='libyang2'
pkgver='2.1.148'
pkgrel='1'
pkgdesc='A YANG data modelling language parser and toolkit written (and providing API) in C'
provides=('libyang')
url="https://github.com/CESNET/libyang"
arch=('x86_64' 'aarch64' 'armv7h')
license=('BSD')
depends=('pcre2')
makedepends=('cmake' 'doxygen' 'graphviz')
checkdepends=('cmocka')
conflicts=('libyang-git' 'libyang-devel-git' 'libyang')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b')

prepare() {
  cd "libyang-${pkgver}"
  mkdir build
}

build() {
  cd "libyang-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DENABLE_TESTS="ON"
  make
}

check() {
  cd "libyang-${pkgver}/build"
  ctest
}

package() {
  cd "libyang-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/libyang"
}
