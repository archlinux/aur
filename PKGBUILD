# Maintainer: racko <tim dot rakowski at gmail dot com>
# Contributor: marauder <abhinav dot kssk at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=9.0.0
pkgrel=1
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'intel-tbb>=3.0' 'libccd>=1.4' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
         'ogre' 'protobuf>=2.3.0' 'sdformat>=6.0.0' 'ignition-math>=4' 'ignition-transport>=4'
         'ignition-common' 'ignition-fuel_tools' 'ignition-msgs' 'tinyxml2' 'qwt')
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
makedepends=('cmake' 'doxygen' 'pkgconf>=0.26')
install="${pkgname}.install"
source=("http://osrf-distributions.s3.amazonaws.com/gazebo/releases/${pkgname}-${pkgver}.tar.bz2" "ogre-1.10.patch")
sha256sums=('2c29955d476c97dc0ccbb1c8295ec6e8ffe203d7bc6047c1f34433a82ab9215e'
            'a1c8a9d181f3de6007361f571a40fd04e780081cd9a9a281d64d316e8cc89892')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np2 -i "${srcdir}/ogre-1.10.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e 's/CODEC_CAP_TRUNCATED/AV_CODEC_CAP_TRUNCATED/g' gazebo/common/AudioDecoder.cc
  sed -i -e 's/CODEC_FLAG_TRUNCATED/AV_CODEC_FLAG_TRUNCATED/g' gazebo/common/AudioDecoder.cc
  
  sed -i -e 's/CODEC_CAP_TRUNCATED/AV_CODEC_CAP_TRUNCATED/g' gazebo/common/Video.cc
  sed -i -e 's/CODEC_FLAG_TRUNCATED/AV_CODEC_FLAG_TRUNCATED/g' gazebo/common/Video.cc
  mkdir -p build && cd build

  # Note: we skip unit tests (else set to TRUE)
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
