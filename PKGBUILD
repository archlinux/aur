# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='libyang'
pkgver='2.1.80'
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
sha256sums=('fc4744839b64628939d291e5c4f3841f2a9aef38a465682703794341687a51c4')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TESTS=ON
  make
}

check() {
  cd "${pkgname}-${pkgver}/build"
  make test
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
