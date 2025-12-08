# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='libyang3'
_pkgname='libyang'
pkgver='3.13.6'
pkgrel='1'
pkgdesc='A YANG data modelling language parser and toolkit written (and providing API) in C'
url="https://github.com/CESNET/${_pkgname}"
arch=('x86_64' 'aarch64' 'armv7h')
license=('BSD-3-Clause')
depends=('pcre2' 'xxhash')
makedepends=('cmake' 'doxygen' 'graphviz')
checkdepends=('cmocka')
provides=("${_pkgname}=${pkgver}")
conflicts=('libyang2' 'libyang' 'libyang-git' 'libyang-devel-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5cd5018f39c830f97d70616c003990287ce5e820ae2792763a49e2a1f63af8d6')

prepare() {
  cd "${_pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${_pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DENABLE_TESTS="ON"
  make
}

check() {
  cd "${_pkgname}-${pkgver}/build"
  ctest
}

package() {
  cd "${_pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
