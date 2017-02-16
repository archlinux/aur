# Maintainer: Ammann Max <maximilian.ammann@googlemail.com>
pkgname=golden-cheetah-git
pkgver=V3.4.r34.18f4606
pkgrel=1
pkgdesc="Cycling Power Analysis Software. We believe that cyclists and triathletes should be able to download their power data to the
computer of their choice, analyze it in whatever way they see fit, and share their methods of
analysis with others."
arch=('i686' 'x86_64')
url="http://www.goldencheetah.org/"
license=('GPL')
makedepends=(bison flex 'gcc' 'make' 'qt5-tools' )
depends=('qt5-base' 'qt5-svg' qt5-location qt5-declarative qt5-webchannel qt5-sensors qt5-serialport qt5-webkit qt5-multimedia qt5-script qt5-connectivity qt5-charts vlc)
optdepends=('vlc' 'qwtplot3d-svn' 'srmio' 'libftd2xx' 'libkml' 'libical' 'libusb' 'libsamplerate')
options=('!strip' '!buildflags' 'staticlibs')
source=('golden-cheetah::git+https://github.com/GoldenCheetah/GoldenCheetah.git'
GoldenCheetah.desktop gc.png gcconfig.pri)
md5sums=('SKIP' af5e5a4376ee82ccfb69aa455b35a2d9 e1fb382b4a7316da1ffd435e45e50c4a '3857988a67fdf94b999fc05753ac2494')

pkgver() {
  cd "${srcdir}/golden-cheetah"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/golden-cheetah/"

  cd "qwt/"
  cp qwtconfig.pri.in qwtconfig.pri
  qmake-qt5 QMAKE_DEFAULT_INCDIRS=
  make -j8

  cd "../kqoauth/"
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
