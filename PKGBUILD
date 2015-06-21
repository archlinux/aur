# Contributor: Aris Synodinos <arissynod-gmail-com>
pkgname=gazebo-hg
pkgver=6.0.0.19165
pkgrel=1
pkgdesc="A multi-robot simulator for outdoor environments. Mercurial version."
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/user_guide/installation__requirements.html
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'intel-tbb>=3.0' 'libccd>=1.4' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
         'ogre' 'protobuf>=2.3.0' 'qt4' 'sdformat>=2.0.1'
         'tinyxml>=2.6.2')
optdepends=('bullet>=2.82: Bullet support'
            'cegui-0.7>=0.7.5: Design custom graphical interfaces'
            'ffmpeg>=0.8.3: Playback movies on textured surfaces'
            'gdal: Digital elevation terrains support'
            'libdart>=3.0: DART support'
            'libusb: USB peripherals support'
            'ruby-ronn: Generate manpages'
            'simbody>=3.3: Simbody support'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'doxygen' 'mercurial'  'pkg-config>=0.26')
install="gazebo.install"
provides=('gazebo')
conflicts=('gazebo')

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
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DENABLE_TESTS_COMPILATION:BOOL=False

  # Compile Gazebo
  make
}

package() {
  cd "${srcdir}/${_dir}/build"

  # Install Gazebo
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
