# Maintainer Yury Bobylev <bobilev_yury@mail.ru>
# Contributor : Andres Urquijo <alfagalileox@gmail.com>

pkgname=mathgl
pkgver=8.0.3
pkgrel=1
pkgdesc="A library for making high-quality scientific graphics"
arch=('x86_64')
url="http://${pkgname}.sourceforge.net"
license=('GPL-3.0-only')
depends=('giflib' 'texlive-latex' 'texlive-latexrecommended' 'texlive-latexextra' 'texlive-plaingeneric' 'hdf5' 'gsl' 'glu' 'qt6-base' 'qt6-5compat' 'libharu' 'libpng' 'freeglut')
makedepends=('cmake' 'gcc' 'make')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname%208.0/$pkgname-$pkgver.tar.gz" "new_libharu.patch")
sha256sums=('9bba9ee6a0f86d1b8f3f3ba0374d3cb776f772dbb6f1a01684ca6c0bd56204d6'
            '4b73de3f1f5069a207ed5124d40dd16d09c0d89cedb8605c461545bf19ed68c9')
options=('staticlibs')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../new_libharu.patch
}


build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -Denable-all-widgets=OFF
    -Denable-double=ON
    -Denable-opengl=ON
    -Denable-mgltex=ON
    -Denable-doc-info=ON
    -Denable-doc-html=ON
    -Denable-doc-pdf-en=ON
    -Denable-doc-pdf-ru=ON
    -Denable-gif=ON
    -Denable-glut=ON
    -Denable-hdf5=ON
    -Denable-pdf=ON
    -Denable-jpeg=ON
    -Denable-mgl2=ON
    -Denable-gsl=ON
    -Denable-png=ON
    -Denable-qt6=ON
    -Denable-qt6asqt=ON
  )

  cmake "${cmake_options[@]}"
  cmake --build build --parallel $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
