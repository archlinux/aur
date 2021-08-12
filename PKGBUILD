# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Kevin Cox <kevincox at kevincox dot ca>

pkgname=backward-cpp
pkgver=1.6
pkgrel=1
pkgdesc="A beautiful stack trace pretty printer for C++."
url="https://github.com/bombela/backward-cpp"
arch=('i686' 'x86_64' 'pentium4' 'i486')
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'binutils' 'libelf' 'libdwarf' 'libunwind')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/bombela/backward-cpp/archive/v${pkgver}.tar.gz")
sha256sums=('c654d0923d43f1cea23d086729673498e4741fb2457e806cfaeaea7b20c97c10')

build() {
  cd "${srcdir}/backward-cpp-${pkgver}"
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBACKWARD_TESTS=true \
    -DBACKWARD_SHARED=true \
  ..

  make
}

check() {
  cd "${srcdir}/backward-cpp-${pkgver}/build"
  make test
}

package() {
  cd "${srcdir}/backward-cpp-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
  install -Dm755 libbackward.so "${pkgdir}/usr/lib/libbackward.so"
  ln -s "/usr/lib/libbackward.so" "${pkgdir}/usr/lib/libbackward.so.${pkgver}"
  install -Dm644 "${srcdir}/backward-cpp-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
