# Maintainer: Michael Prager <archlinuxaur@michaelprager.de>
# Contributor: Ammann Max <maximilian.ammann@googlemail.com>
pkgname=golden-cheetah-git
pkgver=v3.6.RC2.r43.234bdb67e
pkgrel=1
pkgdesc="Cycling Power Analysis Software. We believe that cyclists and triathletes should be able to download their power data to the
computer of their choice, analyze it in whatever way they see fit, and share their methods of
analysis with others."
arch=('i686' 'x86_64')
url="http://www.goldencheetah.org/"
license=('GPL')
makedepends=(bison flex 'gcc' 'make' 'qt5-tools' sip4 pkgconf)
depends=('qt5-base' 'qt5-svg' qt5-location qt5-declarative qt5-webchannel qt5-webengine qt5-sensors qt5-serialport qt5-webkit qt5-multimedia qt5-script qt5-connectivity qt5-charts vlc gsl)
optdepends=('vlc' 'srmio' 'libftd2xx' 'libkml' 'libical' 'libusb-compat' 'libsamplerate' 'r')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('golden-cheetah-rc' 'golden-cheetah-dev' 'golden-cheetah')
source=('golden-cheetah::git+https://github.com/GoldenCheetah/GoldenCheetah.git'
GoldenCheetah.desktop gc.png gcconfig.pri
'https://patch-diff.githubusercontent.com/raw/GoldenCheetah/GoldenCheetah/pull/3628.patch')
sha256sums=('SKIP'
            '6c4f56ba53f2deadec5b16efdecd1311653c2dca2c0378f951672a9b7186f09d'
            'e12471b7864adc877c34cd4cfb23451cae7648b9c8109f400f1af883d4c8cd4e'
            '0cac4a391dc360df375329122a5835fd50b3808ca17451bf56c9221a2710abb4'
            '843d4edf5b49e7620f7dcb58de7fcb65b833e22a1a6273afafda821c3f44da3e')

pkgver() {
  cd "${srcdir}/golden-cheetah"
  printf "%s" "$(git describe --long --tags --exclude v3.5-RC2 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/golden-cheetah/"
  patch --forward --strip=1 --input="${srcdir}/3628.patch"
}

build() {
  cd "${srcdir}/golden-cheetah/"

  cd "qwt/"
  cp qwtconfig.pri.in qwtconfig.pri
  qmake-qt5 QMAKE_DEFAULT_INCDIRS=
  make -j8

  cd "../src/"
  cp $srcdir/gcconfig.pri gcconfig.pri
  qmake-qt5 QMAKE_LRELEASE=/usr/bin/lrelease-qt5 QMAKE_DEFAULT_INCDIRS=
  make -j8
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "${srcdir}/golden-cheetah/src/GoldenCheetah" "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
  mkdir -p "$pkgdir/usr/share/applications/"
  cp "${srcdir}/GoldenCheetah.desktop" "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp "${srcdir}/gc.png" "$pkgdir/usr/share/pixmaps/"
}
