# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Kevin Cox <kevincox@kevincox.ca>

pkgname=backward-cpp
pkgver=1.4
pkgrel=1
pkgdesc="A beautiful stack trace pretty printer for C++."
url="https://github.com/bombela/backward-cpp"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'binutils' 'libelf' 'libdwarf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/bombela/backward-cpp/archive/v${pkgver}.tar.gz")
sha256sums=('ad73be31c5cfcbffbde7d34dba18158a42043a109e7f41946f0b0abd589ed55e')

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
