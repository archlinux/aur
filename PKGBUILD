#
# This package is a quick rewrite of the: sdrangel-no-sdrplay-git which is outdated.
# 
# It's based on: sdrangel-git AUR package.
#
# It's quick&dirty but get's the job done.
#
# Maintainer: Robert Olejnik <arch@nxt.cx>


pkgname=sdrangel-without-sdrplay-git
_pkgname=${pkgname%-git}
pkgver=4.5.0.r23.f76ed4a4
pkgrel=1
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend without SDRPlay support'
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
        'sdrangel-opencv4.patch'
        'CMakeList.txt.patch'
        'CMakeList.txt.patch2')
sha512sums=('SKIP'
            '8c516f85862fa4d79acfc3c4dd54a9cbdc0b53745d611651a741f5c1239f0ded2ca62121361ca5ccf62146f457bb598e4b7036f6a1decb64d86cdc51b6ec1203'
            '48e3313a02b9066aebd1f7f95bce623955594f30c559012cd0b7414451b42e88d531d42a2e0ea60d30af7f48cace489fb2b00fe2aaaf50f99f551220b713faf8'
            'df5474d5fe99816b126be950d3f2eaaf9fd0a3c44845f5438dffd54963dbea8f83acbd6f81d4b194b7448843de77f167ee44f4477cd0d33e3ed9d2ffa4988f2c')

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
  patch sdrangel/plugins/samplesource/CMakeLists.txt ../CMakeList.txt.patch
  patch sdrangel/pluginssrv/samplesource/CMakeLists.txt ../CMakeList.txt.patch2
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

