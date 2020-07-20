# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>

pkgname=gazebo-10
pkgver=10.2.0
pkgrel=3
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'tbb>=3.0' 'libccd>=1.4' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
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
provides=('gazebo')
conflicts=('gazebo')
install="gazebo.install"
source=("https://github.com/osrf/gazebo/archive/gazebo10_$pkgver.tar.gz"
        "fix-openal.patch::https://bitbucket.org/shrit/gazebo/commits/556354dcebd180e0f1015b96890f9906e441b551/raw"
	"cmake-policy.patch")
sha256sums=('8fbba7008be004f6df93f279c26d03910b3b07768881a7e9b0df80b6db738552'
            '4b386e845e94008102609a4fb666d698bee0480d2ce88b250dc1d849cfc93b72'
            'c8c122405a91013f960a7795784ae7332f333f09031bf83887053740ea35fbc9')

prepare() {
  cd "${srcdir}/gazebo-gazebo10_${pkgver}"
  patch --strip=1 --input=${srcdir}/fix-openal.patch
  patch --strip=1 --input=${srcdir}/cmake-policy.patch
}

build() {
  cd "${srcdir}/gazebo-gazebo10_${pkgver}"

  mkdir -p build && cd build

  # Note: we skip unit tests (else set to TRUE)
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
  make
}

package() {
  cd "${srcdir}/gazebo-gazebo10_${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
