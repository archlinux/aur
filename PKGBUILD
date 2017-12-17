# Maintainer: Luca P <meti at lplab.net>
# Contributor: Ammann Max <maximilian.ammann@googlemail.com>

pkgname=golden-cheetah-dev
pkgver=3.5
pkgrel=1
_devtag=1710
pkgdesc="Cycling Power Analysis Software. Development version."
arch=('i686' 'x86_64')
url="http://www.goldencheetah.org/"
license=('GPL')
makedepends=(bison flex 'gcc' 'make' 'qt5-tools' )
depends=('qt5-base' 'qt5-svg' qt5-location qt5-declarative qt5-webchannel qt5-sensors qt5-serialport qt5-webkit qt5-multimedia qt5-script qt5-connectivity qt5-charts vlc)
optdepends=('vlc' 'qwtplot3d-svn' 'srmio' 'libftd2xx' 'libkml' 'libical' 'libusb' 'libsamplerate')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/GoldenCheetah/GoldenCheetah/archive/v$pkgver-DEV$_devtag.tar.gz
gcconfig.pri GoldenCheetah.desktop gc.png)
md5sums=('680dd1db0be0e966bb7e1abcbf79c607'
         '694f79f3df96e8ee8f833c81d1a272f3'
         '5a83da03adf4b4ea14ec459061699c0c'
         'e1fb382b4a7316da1ffd435e45e50c4a')

build() {
  cd "${srcdir}/GoldenCheetah-$pkgver-DEV$_devtag"

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
  cp "${srcdir}/GoldenCheetah-$pkgver-DEV$_devtag/src/GoldenCheetah" "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
  mkdir -p "$pkgdir/usr/share/applications/"
  cp "${srcdir}/GoldenCheetah.desktop" "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp "${srcdir}/gc.png" "$pkgdir/usr/share/pixmaps/"
}

