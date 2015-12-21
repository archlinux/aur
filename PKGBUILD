# Maintainer: Ammann Max <maximilian.ammann@googlemail.com>
pkgname=golden-cheetah-git
pkgver=v3.3.DEV1.r319.2f91591
pkgrel=1
pkgdesc="Cycling Power Analysis Software. We believe that cyclists and triathletes should be able to download their power data to the
computer of their choice, analyze it in whatever way they see fit, and share their methods of
analysis with others."
arch=('i686' 'x86_64')
url="http://www.goldencheetah.org/"
license=('GPL')
makedepends=(bison flex 'gcc' 'make' 'qt5-tools')
depends=('qt5-base' 'qt5-svg' qt5-location qt5-declarative qt5-webchannel qt5-sensors qt5-serialport qt5-webkit)
options=('!strip' '!buildflags' 'staticlibs')
source=('golden-cheetah::git+https://github.com/GoldenCheetah/GoldenCheetah.git'
GoldenCheetah.desktop gc.png)
md5sums=('SKIP' af5e5a4376ee82ccfb69aa455b35a2d9 e1fb382b4a7316da1ffd435e45e50c4a)

pkgver() {
  cd "${srcdir}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/golden-cheetah/"

  cd "qwt/"
  cp qwtconfig.pri.in qwtconfig.pri
  qmake-qt5
  make -j8

  cd "../kqoauth/"
  qmake-qt5
  make -j8

  cd "../src/"
  cp gcconfig.pri.in gcconfig.pri
  qmake-qt5 QMAKE_LRELEASE=/usr/bin/lrelease-qt5
  make -j8
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "${srcdir}/golden-cheetah/src/GoldenCheetah" "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
  cp "${srcdir}/golden-cheetah/src/linux/51-garmin-usb.rules" "$pkgdir/usr/lib/udev/rules.d/"
  chmod a+r "$pkgdir/usr/lib/udev/rules.d/51-garmin-usb.rules"
  mkdir -p "$pkgdir/usr/share/applications/"
  cp "${srcdir}/GoldenCheetah.desktop" "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp "${srcdir}/gc.png" "$pkgdir/usr/share/pixmaps/"
}
