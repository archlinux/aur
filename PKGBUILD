# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=sdrangel-git
_pkgname=${pkgname%-git}
pkgver=6.10.1.r15.ec8cdc63f
pkgrel=1
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/f4exb/sdrangel'
license=('GPL3')
depends=('pkg-config' 'log4cpp' 'opencv' 'fftw' 'ffmpeg'
         'cm256cc' 'dsdcc' 'pulseaudio' 'lz4' 'nanomsg'
         'limesuite'
         'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-websockets' 'qt5-quick3d'
         'qt5-charts' 'qt5-serialport' 'qt5-declarative' 'qt5-location' 'qt5-speech') # QT5
makedepends=('git' 'cmake' 'airspy' 'bladerf' 'hackrf' 'rtl-sdr' 'boost')
optdepends=('ffmpeg: DATV demodulator'
            'libmirisdr4: SDRPlay support'
            'rtl-sdr: RTLSDR support'
            'hackrf: HackRF support'
            'libad9361-iio: PlutoSDR support'
            'limesuite: LimeSDR support'
            'bladerf: BladeRF support'
            'airspy: AirSPY support')
provides=("sdrangel")
conflicts=("sdrangel")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

prepare() {
  cd $_pkgname

}

build() {
  mkdir -p $_pkgname/build
  cd $_pkgname/build

  # https://bugs.gentoo.org/704322
  export CXXFLAGS="$CXXFLAGS -fpermissive"
  cmake .. \
  	-DARCH_OPT="" \
  	-DCMAKE_BUILD_TYPE=Release \
  	-DCMAKE_INSTALL_PREFIX=/usr \
  	-DLIBDSDCC_INCLUDE_DIR=/usr/include/dsdcc \
  	-DCM256CC_INCLUDE_DIR=/usr/include/cm256cc

  make
}

package() {
  cd $_pkgname/build

  make DESTDIR="$pkgdir" install
}

