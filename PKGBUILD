# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Aris Synodinos <arissynod-gmail-com>

pkgname=gazebo-git
pkgver=r32502.5d92404905
pkgrel=8
pkgdesc="A multi-robot simulator for outdoor environments. Git version."
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost' 'curl' 'freeglut' 'freeimage' 'tbb' 'libccd' 'libltdl' 'graphviz'
         'libtar' 'libxml2' 'ogre=1.9' 'protobuf' 'sdformat-9' 'ignition-math' 'ignition-transport-8'
         'ignition-cmake' 'ignition-common-3' 'ignition-fuel_tools-4' 'ignition-msgs-5' 'tinyxml2' 'qwt')

optdepends=('bullet: Bullet support'
            'cegui: Design custom graphical interfaces'
            'ffmpeg: Playback movies on textured surfaces'
            'gdal: Digital elevation terrains support'
            'libdart: DART support'
            'libspnav: space navigator joystick support'
            'libusb: USB peripherals support'
            'simbody: Simbody support'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'make' 'doxygen' 'ruby-ronn' 'git')
install="gazebo.install"
provides=('gazebo')
conflicts=('gazebo')

_pkgname=gazebo

source=("gazebo"::"git+https://github.com/osrf/gazebo") #  "patch"::"https://github.com/osrf/gazebo/pull/3180.patch")
sha256sums=('SKIP') #  'SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	# git apply "${srcdir}/patch"
	# patch -p1 -i "${srcdir}/patch"
}

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build && cd build

  cmake ..  -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  DESTDIR="${pkgdir}" make install
}
