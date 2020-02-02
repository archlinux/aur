# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Aris Synodinos <arissynod-gmail-com>

pkgname=gazebo-hg
pkgver=11.0.0.38902
pkgrel=1
pkgdesc="A multi-robot simulator for outdoor environments. Mercurial version."
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost' 'curl' 'freeglut' 'freeimage' 'intel-tbb' 'libccd' 'libltdl'
         'libtar' 'libxml2' 'ogre=1.9' 'protobuf' 'sdformat>=9' 'ignition-math>=6'
         'ignition-transport>=8' 'ignition-common>=3' 'ignition-fuel_tools>=4'
         'ignition-msgs>=5' 'tinyxml2' 'qwt')
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
makedepends=('cmake' 'doxygen' 'ignition-cmake>=2' 'mercurial')
install="gazebo.install"
provides=('gazebo')

_hgrepo=gazebo
_hgroot=https://bitbucket.org/osrf
_dir=${_hgrepo}

source=("${_hgrepo}"::"hg+${_hgroot}/${_hgrepo}"#branch=default)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_dir}"

  local gazebo_major="$(sed -n 's/set (GAZEBO_MAJOR_VERSION \([0-9]\+\))/\1/p' CMakeLists.txt)"
  local gazebo_minor="$(sed -n 's/set (GAZEBO_MINOR_VERSION \([0-9]\+\))/\1/p' CMakeLists.txt)"
  local gazebo_patch="$(sed -n 's/set (GAZEBO_PATCH_VERSION \([0-9]\+\))/\1/p' CMakeLists.txt)"
  printf "%s.%s" "${gazebo_major}.${gazebo_minor}.${gazebo_patch}" "$(hg identify -n)"
}

build() {
  cd "${srcdir}/${_dir}"

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
  cd "${srcdir}/${_dir}/build"

  # Install Gazebo
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
