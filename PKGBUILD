# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=sdrangel-git
pkgver=4.0.1.r0.95f39109
pkgrel=1
pkgdesc="Qt5/OpenGL SDR and signal analyzer frontend for Airspy, BladeRF, HackRF, RTL-SDR, SDRplay and FunCube"
arch=('any')
url="https://github.com/f4exb/sdrangel"
license=('GPL3')
depends=(
  'pkg-config' 'boost' 'log4cpp'
  'qt5-base>=5.9' 'qt5-tools' 'qt5-multimedia' # QT5
  'fftw' 'lz4' 'nanomsg' 'ffmpeg>=3.1'
  'cm256cc' 'dsdcc>=1.8.3'
  'pulseaudio'
)
makedepends=('git' 'cmake')
optdependds=(
  'ffmpeg: DATV demodulator'
  'libmirisdr4: SDRPlay support'
  'rtl-sdr: RTLSDR support'
  'libad9361-iio: PlutoSDR support'
  'limesuite: LiimeSDR support'
  'bladerf: BladeRF support'
  'airspy: AirSPY support'
)
provides=("sdrangel")
conflicts=("sdrangel")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/${pkgname%-git}
  git describe --long --tags | sed 's/faup1090-//g;s/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

build() {
  mkdir -p $srcdir/${pkgname%-git}/build
  cd $srcdir/${pkgname%-git}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDSDCC_INCLUDE_DIR=/usr/include/dsdcc \
    -DCM256CC_INCLUDE_DIR=/usr/include/cm256cc

  make
}

package() {
  cd $srcdir/${pkgname%-git}/build

  make DESTDIR=$pkgdir install
}

