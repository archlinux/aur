# Maintainer: KNOSSOS team <knossosteam ät gmail.com>
# Contributor: Martin Drawitsch <mdraw.gh ät gmail.com>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIMF/

pkgname=knossos4
pkgver=4.1.2
pkgrel=17
arch=(x86_64)
pkgdesc='A software tool for the visualization and annotation of 3D image data. It was developed for the rapid reconstruction of neural morphology and connectivity.'
url='https://knossos.app'
license=(GPL2)
depends=(curl
  glu
  glut
  pythonqt-knossos-git
  qt5-tools # Qt5Help
  quazip-qt5
  snappy
)
makedepends=(boost
  cmake
  libxmu # CMake wants libxmu for GLUT
  ninja
)
source=("https://github.com/knossos-project/knossos/archive/v$pkgver.tar.gz"
  'curl.patch'
  'knossos4.desktop'
  'qt-5.7.patch'
  'GCC8-combat-K4.patch'
  'https://raw.githubusercontent.com/knossos-project/knossos/464cbb2b13f0142877e70a7d37528a92fe12b99e/CMake/Modules/FindQuaZip.cmake'
  'https://github.com/knossos-project/knossos/commit/f3bfcd80dc582248a59b857609a796d133bb1fa5.patch'
)
md5sums=('c648b510bcec05a914540eea7f577bfa'
         '07e9b7ac1ed5ecd0185ae92e61e97bbb'
         '67a3dfea8d64d8b9eb999f16096819ee'
         '10ac71de3331013293518da4be88cde6'
         '9e6daa1198b3f819379995d37178e3d1'
         'c901e39da0c394200d9f1bb81590d245'
         '03c1501a6cb9b5227d27b0cbbe8689e9')

prepare() {
  cd "knossos-$pkgver"
  patch -p1 -i ../curl.patch
  patch -p1 -i ../qt-5.7.patch
  patch -p1 -i ../GCC8-combat-K4.patch
  cp -v ../FindQuaZip.cmake cmake/Modules
  sed 's|CMake/Modules|cmake/Modules|' -i ../f3bfcd80dc582248a59b857609a796d133bb1fa5.patch
  sed 's|a/annotation/file_io.cpp|a/file_io.cpp|' -i ../f3bfcd80dc582248a59b857609a796d133bb1fa5.patch
  sed 's|quazip5/quazip|quazip/quazip|' -i ../f3bfcd80dc582248a59b857609a796d133bb1fa5.patch
  patch -p1 -i ../f3bfcd80dc582248a59b857609a796d133bb1fa5.patch
  sed 's/snprintf(remoteURL, CSTRING_SIZE, url.toStdString().c_str());/snprintf(remoteURL, CSTRING_SIZE, "%s", url.toStdString().c_str());/' -i network.cpp
  sed 's/NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang"/FALSE/' -i CMakeLists.txt # breaks using/linking some std functions (min, max, …)
  sed '/#include <QThread>/a #include <deque>' -i remote.h
  sed '/#include <QWaitCondition>/a #include <array>' -i stateInfo.h

  pythonqt="Qt5Python$(pacman -Q python | cut -d' ' -f2 | cut -d. -f1-2 --output-delimiter '')"
  echo using $pythonqt
  sed "s/Qt5Python27/$pythonqt/" -i CMakeLists.txt
  cmake -G Ninja -S "$srcdir/knossos-$pkgver" -B "$srcdir/build-$CHOST-$pkgname"
}

build() {
  cmake --build "build-$CHOST-$pkgname"
}

package() {
  install -Dm755 "build-$CHOST-$pkgname/knossos" "$pkgdir/usr/bin/knossos4"
  install -Dm644 "knossos-$pkgver/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos4.png"
  install -Dm644 "knossos4.desktop" "$pkgdir/usr/share/applications/knossos4.desktop"
}
