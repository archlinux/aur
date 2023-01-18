# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='libyang'
pkgver='2.1.30'
pkgrel='1'
pkgdesc='A YANG data modelling language parser and toolkit written (and providing API) in C'
url="https://github.com/CESNET/${pkgname}"
arch=('x86_64' 'aarch64' 'armv7h')
license=('BSD')
depends=('pcre2')
makedepends=('cmake' 'swig' 'doxygen' 'graphviz')
checkdepends=('cmocka' 'shunit2' 'expect')
conflicts=('libyang-git' 'libyang-devel-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('761cfd959342b147f6a43a84c931c7fde68dd3a1ad540a0e5302288b204f073d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TESTS=ON
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
