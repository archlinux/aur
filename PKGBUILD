# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=sdrangel
pkgver=3.14.7
pkgrel=1
pkgdesc="Qt5/OpenGL SDR and signal analyzer frontend for Airspy, BladeRF, HackRF, RTL-SDR, SDRplay and FunCube"
arch=('any')
url="https://github.com/f4exb/sdrangel"
license=('GPL3')
depends=(
  'pkg-config' 'boost' 'log4cpp'
  'qt5-base>=5.5' 'qt5-tools' 'qt5-multimedia' # QT5
  'fftw' 'lz4' 'nanomsg'
  'cm256cc-git' 'dsdcc-git'
  'pulseaudio'
)
makedepends=('git' 'cmake')
optdependds=(
  'libmirisdr4: SDRPlay support'
  'rtl-sdr: RTLSDR support'
  ' libad9361-iio: PlutoSDR support'
  'limesuite: LiimeSDR support'
  'bladerf: BladeRF support'
  'airspy: AirSPY support'
  ''
)
provides=("sdrangel")
conflicts=("sdrangel")
source=("https://github.com/f4exb/sdrangel/archive/v$pkgver.tar.gz")
sha256sums=('12880f7f12394039a61a43eb8108b00311a41d90fb0830c52057e90bc15971c8')

build() {
  mkdir -p $srcdir/$pkgname-$pkgver/build
  cd $srcdir/$pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/sdrangel \
    -DLIBDSDCC_INCLUDE_DIR=/usr/include/dsdcc \
    -DCM256CC_INCLUDE_DIR=/usr/include/cm256cc

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build

  make DESTDIR=$pkgdir install

  # For some reason SDRangel only works if it is installed outside of /usr,
  # so we install it into /opt/sdrangel and create link to it in /usr/bin
  install -dm 755 "$pkgdir/usr/bin"
  ln -s /opt/sdrangel/bin/sdrangel "$pkgdir/usr/bin/sdrangel"
}
