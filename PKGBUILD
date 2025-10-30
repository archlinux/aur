# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='libyang'
pkgver='3.13.6'
pkgrel='1'
pkgdesc='A YANG data modelling language parser and toolkit written (and providing API) in C'
url="https://github.com/CESNET/${pkgname}"
arch=('x86_64' 'aarch64' 'armv7h')
license=('BSD')
depends=('pcre2')
makedepends=('cmake' 'doxygen' 'graphviz')
checkdepends=('cmocka')
conflicts=('libyang-git' 'libyang-devel-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5cd5018f39c830f97d70616c003990287ce5e820ae2792763a49e2a1f63af8d6')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir build
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
