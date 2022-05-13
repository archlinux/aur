# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Troy Patrick <patrictroy at gmail dot com>
# Contributor: racko <tim dot rakowski at gmail dot com>
# Contributor: marauder <abhinav dot kssk at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=11.10.2
pkgrel=3
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
depends=('boost' 'curl' 'freeglut' 'freeimage' 'tbb' 'libccd' 'libltdl' 'graphviz'
         'libtar' 'libxml2' 'ogre-1.9' 'protobuf>=2.3.0' 'sdformat-9' 'ignition-math>=6' 'ignition-transport-8'
         'ignition-cmake>=2' 'ignition-common-3' 'ignition-fuel_tools-4' 'ignition-msgs-5' 'tinyxml2' 'qwt')
optdepends=('bullet: Bullet support'
            'cegui: Design custom graphical interfaces'
            'ffmpeg4.4: Playback movies on textured surfaces'
            'gdal: Digital elevation terrains support'
            'libdart: DART support'
            'libspnav: space navigator joystick support'
            'libusb: USB peripherals support'
            'simbody: Simbody support'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'doxygen' 'ruby-ronn')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osrf/gazebo/archive/${pkgname}11_$pkgver.tar.gz"
        "string.patch"::"https://github.com/osrf/gazebo/commit/2f0f7af4868883d1a6fea30086b3fcd703d583fc.patch")
sha256sums=('9570454e0341e40881ed8659f8ec9aa45e24d172421e8556d0714cf7b5018511'
            'a94a7e22696074f88ae1a8f2af3f39ef5041b91785b2b52a73dbf8b9a1c4fd52')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}11_$pkgver"

  patch --strip=1 < "${srcdir}/string.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgname}11_$pkgver"

  mkdir -p build && cd build

  export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}11_$pkgver/build"
  DESTDIR="${pkgdir}" make install
}
