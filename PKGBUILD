# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=sdrangel-git
pkgver=4.0.0.r0.f76fafe8
pkgrel=1
pkgdesc="Qt5/OpenGL SDR and signal analyzer frontend for Airspy, BladeRF, HackRF, RTL-SDR, SDRplay and FunCube"
arch=('any')
url="https://github.com/f4exb/sdrangel"
license=('GPL3')
depends=(
  'pkg-config' 'boost' 'log4cpp'
  'qt5-base>=5.9' 'qt5-tools' 'qt5-multimedia' # QT5
  'fftw' 'lz4' 'nanomsg'
  'cm256cc' 'dsdcc'
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
source=(
  "git+$url"
  'qt_use_modules.patch'
)
sha256sums=(
  'SKIP'
  '5e08f2bf5c3743381142f64e0657517e1ac5ffe0effb83df13f69a78b8ca2a23'
)

pkgver() {
  cd $srcdir/${pkgname%-git}
  git describe --long --tags | sed 's/faup1090-//g;s/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

prepare() {
  # Patch the Qt 5.11 installation
  sed -i "s/SOURCE_FOLDER/${pkgname%-git}/g" qt_use_modules.patch
  patch -p0 < qt_use_modules.patch

  # Patch the DATV demodulator
  sed -i 's/FF_INPUT_BUFFER_PADDING_SIZE/AV_INPUT_BUFFER_PADDING_SIZE/g' $srcdir/${pkgname%-git}/plugins/channelrx/demoddatv/datvideorender.cpp
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

  # For some reason SDRangel only works if it is installed outside of /usr,
  # so we install it into /opt/sdrangel and create link to it in /usr/bin
#  install -dm 755 $pkgdir/usr/bin
#  ln -s /opt/sdrangel/bin/sdrangel "$pkgdir/usr/bin/sdrangel"
  # seems to be fixed !?
}
