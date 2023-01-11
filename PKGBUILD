# Maintainer: epitron <chris AT ill-logic.com>

pkgname=ansilove
pkgver=4.1.6
pkgrel=1
libver=1.3.1
pkgdesc='A program to convert ANSI and artscene related file formats into PNG images'
url='https://ansilove.org/'
license=('BSD')
depends=('gd')
makedepends=('git' 'cmake' 'gcc')
source=(
  "https://github.com/ansilove/ansilove/releases/download/${pkgver}/ansilove-${pkgver}.tar.gz"
  "https://github.com/ansilove/libansilove/releases/download/${libver}/libansilove-${libver}.tar.gz"
)
sha256sums=('acc3d6431cdb53e275e5ddfc71de5f27df2f2c5ecc46dc8bb62be9e6f15a1cd0'
            '4919d9a1243df7b23de677ea595f56aa7f6be7187fb0835f1915a06865c11f85')
arch=('x86_64' 'i686')

build() {
  cd "${srcdir}/libansilove-${libver}"
  cmake . -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr"
  make

  cd "${srcdir}/ansilove-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" -DANSILOVE_INCLUDE_DIRS=../libansilove-${libver}/include/ -D ANSILOVE_LIBRARIES=../libansilove-${libver}/libansilove.so .
  make
}

package() {
  cd "${srcdir}/libansilove-${libver}"
  make install

  cd "${srcdir}/ansilove-${pkgver}"
  make install

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/ansilove/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/ansilove/README.md"
}

