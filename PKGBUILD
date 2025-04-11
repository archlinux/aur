# Maintainer: epitron <chris AT ill-logic.com>

pkgname=ansilove
pkgver=4.2.1
pkgrel=1
libver=1.4.2
pkgdesc='A program to convert ANSI and artscene related file formats into PNG images'
url='https://ansilove.org/'
license=('BSD')
depends=('gd')
makedepends=('git' 'cmake' 'gcc')
source=(
  "https://github.com/ansilove/ansilove/releases/download/${pkgver}/ansilove-${pkgver}.tar.gz"
  "https://github.com/ansilove/libansilove/releases/download/${libver}/libansilove-${libver}.tar.gz"
)
sha256sums=('60b1f1b6e4a5be287bb19310ea526c631a0bea5f4cb550f33c301a4b1ec30abf'
            '8bd4d0775ff558aacfebd7e7e284baa96d781183bf767283bf8410f44a2e2434')
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

