# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=reproc
pkgver=1.0.0
pkgrel=2
pkgdesc='Cross-platform library that simplifies working with external CLI applications from C and C++'
arch=('x86_64')
_url='https://github.com/DaanDeMeyer'
url="${_url}/reproc"
license=('MIT')
makedepends=('cmake' 'gcc')
source=("${url}/archive/v${pkgver}".tar.gz)
sha256sums=('b43c9f8faed0cbe2c2c884a485909c05f6b8bda380ca4cc9cc8fc8d73db311dd')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DREPROC_INSTALL=ON \
    -DREPROC_BUILD_TESTS=ON \
    -DREPROC_BUILD_EXAMPLES=ON \
    ../
  make
}

check() {
  cmake --build "${pkgname}-${pkgver}/build" --target reproc-run-tests
}

package() {
  cmake --build "${pkgname}-${pkgver}/build" --target install

  mv "${pkgdir}"/usr/lib64 "${pkgdir}"/usr/lib
  install -D --mode=644 "${srcdir}/${pkgname}-${pkgver}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
