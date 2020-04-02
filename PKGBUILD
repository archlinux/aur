# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=sdrangel-git
_pkgname=${pkgname%-git}
pkgver=4.13.0.r0.583a144c6
pkgrel=2
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/f4exb/sdrangel'
license=('GPL3')
depends=('pkg-config' 'log4cpp' 'opencv' 'fftw' 'ffmpeg'
         'cm256cc' 'dsdcc' 'pulseaudio' 'lz4' 'nanomsg'
         'limesuite'
         'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-websockets') # QT5
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
source=("git+$url"
        'sdrangel-opencv4.patch')
sha512sums=('SKIP'
            'e27b43c8565cc03b8ec66e17e5429c29add8b9e1f1bdaebbbd75442fe08721fc6c89dbb478f8642146f2293962c639a36efdb6aa0276e54930f0745106ae8dda')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

prepare() {
  cd $_pkgname

  patch -p1 < ../sdrangel-opencv4.patch # Fix build with openCV 4
}

build() {
  mkdir -p $_pkgname/build
  cd $_pkgname/build

  # https://bugs.gentoo.org/704322
  export CXXFLAGS="$CXXFLAGS -fpermissive"
  cmake .. \
	-DENABLE_GENERIC=1 \
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

