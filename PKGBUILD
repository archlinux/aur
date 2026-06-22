# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='libyang'
pkgver='5.8.6'
pkgrel='1'
pkgdesc='A YANG data modelling language parser and toolkit written (and providing API) in C'
_uri="github.com/CESNET/${pkgname}"
url="https://${_uri}"
arch=('x86_64' 'aarch64' 'armv7h')
license=('BSD')
depends=('pcre2' 'xxhash')
makedepends=('cmake' 'doxygen' 'graphviz')
checkdepends=('cmocka' 'expect')
conflicts=('libyang-git' 'libyang-devel-git')
source=("${url}/archive/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('6906b0f26c1d4494c5c2464313b16169ec92ccd07b45ecf3a1e9eb9cd7a55c0b')

prepare() {
  mkdir "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DENABLE_TESTS="ON"
  make
}

check() {
  cd "${pkgname}-${pkgver}/build"
  ctest
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
