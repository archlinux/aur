# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=sdrangel
pkgver=4.5.3
pkgrel=1
pkgdesc='Qt5/OpenGL SDR and signal analyzer frontend'
arch=('x86_64')
url='https://github.com/f4exb/sdrangel'
license=('GPL3')
depends=('pkg-config' 'log4cpp' 'opencv' 'fftw'  'ffmpeg'
         'cm256cc' 'dsdcc' 'pulseaudio' 'lz4' 'nanomsg'
         'qt5-base' 'qt5-tools' 'qt5-multimedia') # QT5
makedepends=('cmake' 'ffmpeg' 'airspy' 'bladerf' 'hackrf' 'limesuite' 'rtl-sdr' 'boost')
optdepends=('ffmpeg: DATV demodulator'
            'rtl-sdr: RTLSDR support'
            'hackrf: HackRF support'
            'limesuite: LimeSDR support'
            'bladerf: BladeRF support'
            'airspy: AirSPY support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" sdrangel-opencv4.patch)
sha512sums=('ef32c4f20fca5578e8d2de3b4ff822d25ee8f7430504578a81b231f987bdd11a1087e2e19135d5f02274e7a1c1d8a76808d9c2626330ae076adc07f6d778652e'
            'bc9519a0f08cc6372b3290ed475e3a70b71d4a29f2cedefd349f9ba220a9d446c05c02ca648f068ee298612b85faeda96d45d186120555382b2df99596576e7e')

prepare() {
  sed -i 's|sdrangel_icon.xpm|sdrangel.xpm|' $pkgname-$pkgver/desktop/sdrangel.desktop
  cd $pkgname-$pkgver
  patch -p1 -i ../sdrangel-opencv4.patch # Fix build with openCV 4
}

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDSDCC_INCLUDE_DIR=/usr/include/dsdcc \
    -DCM256CC_INCLUDE_DIR=/usr/include/cm256cc

  make
}

package() {
  cd $pkgname-$pkgver/build

  make DESTDIR="$pkgdir" install

  # Install .desktop file
  install -Dm 644 ../desktop/sdrangel_icon.xpm "$pkgdir"/usr/share/pixmaps/sdrangel.xpm
  install -Dm 644 ../desktop/sdrangel.desktop "$pkgdir"/usr/share/applications/adrangel.desktop
}

