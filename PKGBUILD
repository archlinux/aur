# Maintainer: Stefan Damm <autama@nurfuerspam.de>
pkgname=entropy-piano-tuner
pkgver=1.2.0.r27.gee7857a
pkgrel=1
pkgdesc="Free Software for Piano Tuning"
arch=('i686' 'x86_64')
url="https://gitlab.com/tp3/Entropy-Piano-Tuner"
license=('GPL3')
depends=('qtmidi-qt5' 'qwt' 'libuv' 'hicolor-icon-theme' 'qt5-multimedia' 'fftw' 'qt5-declarative')

source=(git+https://gitlab.com/tp3/Entropy-Piano-Tuner.git
        git+https://gitlab.com/chwick/fftw3-qmake.git
        git+https://github.com/libuv/libuv.git
        git+https://gitlab.com/chwick/qwt-lib.git
        git+https://gitlab.com/tp3/tp3log.git
        rpath.patch
        qwt-lib-qt5.15.patch)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'e7f34645ebe707be6d417f1f4bc31ebd'
         'ec874c86d32d0e4a7e4acbfb8262c86d')

pkgver() {
  cd Entropy-Piano-Tuner
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd Entropy-Piano-Tuner

  git submodule init
  git config submodule.thirdparty/fftw3.url $srcdir/fftw3-qmake
  git config submodule.thirdparty/libuv/libuv.url $srcdir/libuv
  git config submodule.thirdparty/qwt-lib.url $srcdir/qwt-lib
  git config submodule.thirdparty/tp3log.url $srcdir/tp3log
  git submodule update

  patch -Np1 -i ../rpath.patch
  # Qt 5.15 broke QPainterPath stuff; fortunately it’s an easy fix.
  patch -Np1 -i ../qwt-lib-qt5.15.patch
}

build() {
  cd "Entropy-Piano-Tuner"

  rm -rf build
  mkdir build
  cd build

  qmake-qt5 -r .. "PKGDIR=$pkgdir/" "EPT_INSTALL_BIN_RDIR=usr/bin" "EPT_INSTALL_DATA_RDIR=usr/share" "EPT_INSTALL_LIB_RDIR=usr/lib"
  make
}

package() {
  cd "Entropy-Piano-Tuner/build"

  make install

  echo "Test"
}
