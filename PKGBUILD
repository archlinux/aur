# Maintainer: KNOSSOS team <knossosteam ät gmail.com>
# Contributor: Martin Drawitsch <mdraw.gh ät gmail.com>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIN/

pkgname=knossos
pkgver=5.1
pkgrel=8
arch=(x86_64)
pkgdesc='A software tool for the visualization and annotation of 3D image data. It was developed for the rapid reconstruction of neural morphology and connectivity.'
url='https://knossos.app'
license=(GPL2)
depends=(glu
  qt5-base
  pythonqt-knossos-git
  quazip-qt5
  snappy
)
makedepends=(boost
  cmake
  ninja
)
optdepends=(qt5-imageformats) # Jp2
source=("https://github.com/knossos-project/knossos/archive/v$pkgver.tar.gz"
  'knossos.desktop'
  'GCC8-combat-K5.patch'
  'https://raw.githubusercontent.com/knossos-project/knossos/f3bfcd80dc582248a59b857609a796d133bb1fa5/CMake/Modules/FindQuaZip.cmake'
  'https://github.com/knossos-project/knossos/commit/b6f40b52.patch'
)
md5sums=('fd97340a07b58b3f1b1543405d893c35'
         '1a2b3733cf5fcb3e1845ce771abb58e9'
         '9e6daa1198b3f819379995d37178e3d1'
         'b7f68f267e26f86db118cfafbb006ec9'
         'a20f2a68985b3e971b9ff1e0d61a8006')

prepare() {
  cd "knossos-$pkgver"
  patch -p1 -i ../GCC8-combat-K5.patch
  cp -v ../FindQuaZip.cmake CMake/Modules
  patch -p1 -i ../b6f40b52.patch
  sed 's/auto createGlobalAction/static auto createGlobalAction/' -i widgets/mainwindow.h
  sed 's/auto threeWaySorting/static auto threeWaySorting/' -i widgets/tools/model_helper.h
  sed 's/auto blockSelection/static auto blockSelection/' -i widgets/tools/model_helper.h
  sed 's/auto deltaBlockSelection/static auto deltaBlockSelection/' -i widgets/tools/model_helper.h
  sed 's/NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang"/FALSE/' -i CMakeLists.txt # breaks using/linking some std functions (min, max, …)
  # python3/qt slots keyword conflict
  sed 's/#include <Python.h>/PyObject* PyBuffer_FromReadWriteMemory(void *ptr, size_t size) {}/' -i scriptengine/proxies/pythonproxy.cpp
  sed '/Python.h/d' -i widgets/pythonpropertywidget.cpp

  pythonqt="Qt5Python$(pacman -Q python | cut -d' ' -f2 | cut -d. -f1-2 --output-delimiter '')"
  echo using $pythonqt
  cmake -G Ninja -Dpythonqt="$pythonqt" -S "$srcdir/knossos-$pkgver" -B "$srcdir/build-$CHOST-$pkgname"
}

build() {
  cmake --build "build-$CHOST-$pkgname"
}

package() {
  install -Dm755 "build-$CHOST-$pkgname/knossos" "$pkgdir/usr/bin/knossos"
  install -Dm644 "knossos-$pkgver/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos.png"
  install -Dm644 "knossos.desktop" "$pkgdir/usr/share/applications/knossos.desktop"
}
