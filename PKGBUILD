# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='libyang'
pkgver='5.4.9'
pkgrel='2'
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
sha256sums=('f36372e1b1b8835e8aec86f44c766b65158cc6aefb5f9352ddbc0fe2c558000a')

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
