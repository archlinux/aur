# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=5.0.1
pkgrel=4
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'intel-tbb>=3.0' 'libccd>=1.4' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
         'ogre' 'protobuf>=2.3.0' 'qt4' 'sdformat>=2.0.1'
         'tinyxml>=2.6.2')
optdepends=('bullet>=2.82: Bullet support'
            'cegui>=0.8.3: Design custom graphical interfaces'
            'ffmpeg>=0.8.3: Playback movies on textured surfaces'
            'gdal: Digital elevation terrains support'
            'libdart>=3.0: DART support'
            'libusb: USB peripherals support'
            'ruby-ronn: Generate manpages'
            'simbody>=3.3: Simbody support'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'doxygen' 'pkg-config>=0.26')
install="${pkgname}.install"
source=("http://osrf-distributions.s3.amazonaws.com/gazebo/releases/${pkgname}-${pkgver}.tar.bz2"
        "boost1.58.patch"
        "bullet2.83.patch")
sha256sums=('81773edbf709359f4191ff33b6b2e6adf395a88806022c8cfa964963e5c7099b'
            'e4bf17b4e0fbe3094a17af108e4e08627b169890b365737b42a80456c17d7bad'
            '7e82c241e1179348e9040bdf87232fb655c492597d4efcb87a6c886a77fa0567')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix gdal includes
  msg "Applying gdal includes fix..."
  find . -type f -exec sed -i 's|include <gdal/|include <|g' {} \;

  # Apply Boost 1.58 patch (fixed upstream)
  msg "Applying Boost 1.58 patch..."
  patch -p1 < ${srcdir}/boost1.58.patch

  # Apply Bullet 2.83 patch (fixed upstream)
  msg "Applying Bullet 2.83 patch..."
  patch -p1 < ${srcdir}/bullet2.83.patch

  # Create build directory
  mkdir -p build && cd build

  # Run CMake
  # Note: we skip unit tests (else set to TRUE)
  msg "Preparing Makefiles..."
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DENABLE_TESTS_COMPILATION:BOOL=False

  # Compile Gazebo
  msg "Compiling..."
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  # Install Gazebo
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
