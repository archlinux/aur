# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Contributor: Troy Patrick <patrictroy at gmail dot com>
# Contributor: racko <tim dot rakowski at gmail dot com>
# Contributor: marauder <abhinav dot kssk at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=11.9.1
pkgrel=2
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
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
makedepends=('cmake' 'git' 'ninja' 'doxygen' 'ruby-ronn')
install="${pkgname}.install"
source=("git+https://github.com/osrf/gazebo.git#tag=gazebo11_$pkgver"
        "fix-for-tbb-2021.patch")
sha256sums=('SKIP'
            '5a185f53ad1649945c1ffcf6c61c86631bd35917547eac3b14b33ca177a4e6bb')

prepare() {
  cd "${srcdir}/${pkgname}"

  # Fix for newer versions of protobuf
  git cherry-pick 2f0f7af4868883d1a6fea30086b3fcd703d583fc

  # Gazebo's CMake package file forces projects using it to use C++11 by default
  # which screws over anyone wanting to use C++14 or newer
  sed -i '/-std=c++11/d' cmake/gazebo-config.cmake.in

  # Workaround for this issue: https://github.com/osrf/gazebo/issues/2867
  patch -p1 < ../fix-for-tbb-2021.patch
}

build() {
  cd "${srcdir}/${pkgname}"

  mkdir -p build && cd build

  export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
  cmake .. -GNinja \
           -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
  ninja
}

package() {
  cd "${srcdir}/${pkgname}/build"
  DESTDIR="${pkgdir}" ninja install
}
