# Maintainer: maz-1 <ohmygod19993 at gmail dot com>

_pkgname=krename
pkgname=$_pkgname-frameworks
pkgver=4.0.9
pkgrel=1
pkgdesc="A very powerful batch file renamer for KDE. KF5 Version."
arch=('i686' 'x86_64')
url="http://www.krename.net"
license=('GPL')
depends=('kdelibs4support' 'taglib' 'podofo' 'kjs' 'exiv2' 'hicolor-icon-theme')
makedepends=('cmake' 'automoc4' 'extra-cmake-modules' 'kdoctools')
provides=($_pkgname)
conflicts=($_pkgname)
install=krename.install
source=(http://downloads.sourceforge.net/project/krename/KDE4%20krename-stable/${pkgver}/${_pkgname}-${pkgver}.tar.bz2
        "fix_libpodofo.patch"
        "port_to_kf5.patch")
sha1sums=('03886a385a16de4c9bc285d25b9816ea97768c9e' 'SKIP' 'SKIP')
options=('libtool')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -p1 -i ${srcdir}/fix_libpodofo.patch
  patch -p1 -i ${srcdir}/port_to_kf5.patch
}

build() {
  mkdir build
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF\
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-I/usr/include/freetype2"
  #sed -i 's|/share/locale|/share/locale/kde4|' po/cmake_install.cmake
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
