# Maintainer: epitron <chris AT ill-logic.com>

pkgname=ansilove-git
pkgver=3.0.9.r20.g9fad130
pkgrel=1
pkgdesc='Program and shared library to converts ANSI and artscene related file formats into PNG images'
url='https://ansilove.org/'
license=('BSD')
depends=('gd')
makedepends=('git' 'cmake' 'gcc')
provides=('ansilove')
conflicts=('ansilove')
arch=('x86_64' 'i686')
source=(
  'git+https://github.com/ansilove/libansilove.git'
  'git+https://github.com/ansilove/ansilove.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/ansilove"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # shared library
  mkdir "${srcdir}/libansilove/build"
  cd "${srcdir}/libansilove/build"

  cmake .. \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr"
  make

  # executable
  mkdir "${srcdir}/ansilove/build"
  cd "${srcdir}/ansilove/build"

  cmake .. \
    -DANSILOVE_INCLUDE_DIRS="${srcdir}/libansilove/include/" \
    -DANSILOVE_LIBRARIES="${srcdir}/libansilove/build/libansilove.so" \
    -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/libansilove/build"
  make install

  cd "${srcdir}/ansilove/build"
  make install

  install -Dm644 "${srcdir}/ansilove/LICENSE" "${pkgdir}/usr/share/licenses/ansilove/LICENSE"
  install -Dm644 "${srcdir}/ansilove/README.md" "${pkgdir}/usr/share/doc/ansilove/README.md"
}

