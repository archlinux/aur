# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Flamelab <panosfilip@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=libkface-frameworks-git
pkgver=5.0.0.r744.c8d04a4
pkgrel=1
pkgdesc="A Qt/C++ wrapper around LibFace library to perform face recognition and detection over pictures. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.digikam.org/sharedlibs'
license=('GPL' 'LGPL' 'FDL')
depends=('opencv'
         'qt5-base')
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
conflicts=('libkface')
source=('git://anongit.kde.org/libkface#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libkface
  _ver="$(cat CMakeLists.txt | grep -m3 -e KFACE_LIB_MAJOR_VERSION -e KFACE_LIB_MINOR_VERSION -e KFACE_LIB_PATCH_VERSION | cut -d '"' -f2 | paste -sd'.')"
  echo -e "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkface \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    #-DENABLE_OPENCV3=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
