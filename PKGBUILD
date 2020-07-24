# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Aris Synodinos <arissynod-gmail-com>

pkgname=gazebo-git
pkgver=r32276.2369ecd863
pkgrel=1
pkgdesc="A multi-robot simulator for outdoor environments. Git version."
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost' 'curl' 'freeglut' 'freeimage' 'intel-tbb' 'libccd' 'libltdl'
         'libtar' 'libxml2' 'ogre=1.9' 'protobuf' 'sdformat' 'ignition-math'
         'ignition-transport' 'ignition-common' 'ignition-fuel_tools'
         'ignition-msgs' 'tinyxml2' 'qwt')
optdepends=('bullet: Bullet support'
            'cegui: Design custom graphical interfaces'
            'ffmpeg: Playback movies on textured surfaces'
            'gdal: Digital elevation terrains support'
            'libdart: DART support'
            'libspnav: space navigator joystick support'
            'libusb: USB peripherals support'
            'ruby-ronn: Generate manpages'
            'simbody: Simbody support'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'doxygen' 'ruby-ronn' 'git')
install="gazebo.install"
provides=('gazebo')
conflicts=('gazebo')

_pkgname=gazebo

source=("gazebo"::"git+https://github.com/osrf/gazebo")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Create build directory
  mkdir -p build && cd build

  # Run CMake
  # Note: we skip unit tests (else set to TRUE)
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"

  # Compile Gazebo
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  # Install Gazebo
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
