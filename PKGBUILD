# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='libyang'
pkgver='2.1.4'
pkgrel='1'
pkgdesc='A YANG data modelling language parser and toolkit written (and providing API) in C'
url="https://github.com/CESNET/${pkgname}"
arch=('x86_64' 'aarch64' 'armv7h')
license=('BSD')
depends=('pcre2')
makedepends=('cmake' 'swig' 'doxygen' 'graphviz')
checkdepends=('cmocka' 'shunit2' 'expect')
conflicts=('libyang-git' 'libyang-devel-git')
source=("${url}/archive/v${pkgver}.tar.gz"
"${url}/commit/b4cf6d1246f98d94f9c0ccf3d998478893488aca.patch")
sha256sums=('f30ee1c3e13f0c5d25c4d2fb628e4b262b483d0a500464a7c12008ccc393a69e'
            '7d50d130c137f7c02c609419a0caf14e8f574faad5fcaaa1d1492f0058386e48')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # unit test hot fix
  patch -p1 -i "${srcdir}/b4cf6d1246f98d94f9c0ccf3d998478893488aca.patch"
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
