# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=sdrangel-git
_pkgname=${pkgname%-git}
pkgver=4.4.5.r2.b8ed5a77
pkgrel=1
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/f4exb/sdrangel'
license=('GPL3')
depends=('pkg-config' 'log4cpp' 'opencv' 'fftw'  'ffmpeg'
         'cm256cc' 'dsdcc' 'pulseaudio' 'lz4' 'nanomsg'
         'qt5-base' 'qt5-tools' 'qt5-multimedia') # QT5
makedepends=('git' 'cmake' 'ffmpeg' 'airspy' 'bladerf' 'hackrf' 'limesuite' 'rtl-sdr' 'boost')
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
            '8c516f85862fa4d79acfc3c4dd54a9cbdc0b53745d611651a741f5c1239f0ded2ca62121361ca5ccf62146f457bb598e4b7036f6a1decb64d86cdc51b6ec1203')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

prepare() {
  cd $_pkgname

  sed -i 's|sdrangel_icon.xpm|sdrangel.xpm|' desktop/sdrangel.desktop
  patch -p1 < ../sdrangel-opencv4.patch # Fix build with openCV 4
}

build() {
  mkdir -p $_pkgname/build
  cd $_pkgname/build

  cmake .. \
  	-DCMAKE_BUILD_TYPE=Release \
  	-DCMAKE_INSTALL_PREFIX=/usr \
  	-DLIBDSDCC_INCLUDE_DIR=/usr/include/dsdcc \
  	-DCM256CC_INCLUDE_DIR=/usr/include/cm256cc

  make
}

package() {
  cd $_pkgname/build

  make DESTDIR="$pkgdir" install

  # Install .desktop file
  install -Dm 644 ../desktop/sdrangel_icon.xpm "$pkgdir"/usr/share/pixmaps/sdrangel.xpm
  install -Dm 644 ../desktop/sdrangel.desktop "$pkgdir"/usr/share/applications/adrangel.desktop
}

