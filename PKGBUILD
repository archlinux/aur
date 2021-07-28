# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Contributor: Troy Patrick <patrictroy at gmail dot com>
# Contributor: racko <tim dot rakowski at gmail dot com>
# Contributor: marauder <abhinav dot kssk at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=11.7.0
pkgrel=2
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost' 'curl' 'freeglut' 'freeimage' 'intel-tbb' 'libccd' 'libltdl' 'graphviz'
         'libtar' 'libxml2' 'ogre-1.9' 'protobuf>=2.3.0' 'sdformat-9' 'ignition-math>=6' 'ignition-transport-8'
         'ignition-cmake>=2' 'ignition-common-3' 'ignition-fuel_tools-4' 'ignition-msgs-5' 'tinyxml2' 'qwt')
optdepends=('bullet: Bullet support'
            'cegui: Design custom graphical interfaces'
            'ffmpeg: Playback movies on textured surfaces'
            'gdal: Digital elevation terrains support'
            'libdart: DART support'
            'libspnav: space navigator joystick support'
            'libusb: USB peripherals support'
            'simbody: Simbody support'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'ninja' 'doxygen' 'ruby-ronn')
install="${pkgname}.install"
source=("http://osrf-distributions.s3.amazonaws.com/$pkgname/releases/$pkgname-$pkgver.tar.bz2")
sha256sums=('c3ede937e6a2130c191329df0e4080452070575b232a2d45291f429e0462a407')

prepare() {
  # Gazebo's CMake package file forces projects using it to use C++11 by default which screws over anyone wanting to use C++14 or newer
  sed -i '/-std=c++11/d' "$srcdir"/$pkgname-$pkgver/cmake/gazebo-config.cmake.in
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build && cd build

  cmake .. -GNinja \
           -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}
