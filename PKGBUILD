# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Kevin Cox <kevincox at kevincox dot ca>

pkgname=backward-cpp
pkgver=1.5
pkgrel=1
pkgdesc="A beautiful stack trace pretty printer for C++."
url="https://github.com/bombela/backward-cpp"
arch=('i686' 'x86_64' 'pentium4' 'i486')
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'binutils' 'libelf' 'libdwarf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/bombela/backward-cpp/archive/v${pkgver}.tar.gz")
sha256sums=('faf7d4fe7ca65117ed4fe7be9bff9628927bd95b49f71df63d5f99af233d1915')

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
