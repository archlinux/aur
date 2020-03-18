# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Contributor: Troy Patrick <patrictroy at gmail dot com>
# Contributor: racko <tim dot rakowski at gmail dot com>
# Contributor: marauder <abhinav dot kssk at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=10.2.0
pkgrel=2
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'intel-tbb>=3.0' 'libccd>=1.4' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
         'ogre-1.9' 'protobuf>=2.3.0' 'sdformat=6' 'ignition-math=4' 'ignition-transport=4'
         'ignition-cmake-0' 'ignition-common=1' 'ignition-fuel_tools=1' 'ignition-msgs=1' 'tinyxml2' 'qwt')
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
makedepends=('cmake' 'doxygen')
install="${pkgname}.install"
source=("http://osrf-distributions.s3.amazonaws.com/$pkgname/releases/$pkgname-$pkgver.tar.bz2"
        "fix-openal.patch::https://bitbucket.org/shrit/gazebo/commits/556354dcebd180e0f1015b96890f9906e441b551/raw")
sha256sums=('47d8bfe70ffcde21cbc6dec142f3aecefaac66c63562aab6114f442f7ab27392'
            '4b386e845e94008102609a4fb666d698bee0480d2ce88b250dc1d849cfc93b72')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch --strip=1 --input=../fix-openal.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

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
