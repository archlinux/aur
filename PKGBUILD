# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-wpilib
pkgver=2018.1.1
pkgrel=1
pkgdesc="The WPI FIRST Robotics Competition C/C++ library for the arm-frc-linux-gnueabi toolchain"
arch=(i686 x86_64)
url="https://github.com/wpilibsuite/allwpilib"
license=('custom=FRC-BSD')
groups=('frc-toolchain')
depends=("${_target}-gcc")
makedepends=('git' 'java-environment=8' 'unzip')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("git+git://github.com/wpilibsuite/allwpilib#tag=v2018.1.1")
sha512sums=('SKIP')

build() {
  cd "$srcdir/allwpilib"
  ./gradlew build
}

package() {
  cd "$srcdir/allwpilib"

  mkdir -p $pkgdir/usr/${_target}/include
  mkdir -p $pkgdir/usr/${_target}/lib
  mkdir -p $pkgdir/usr/include
  mkdir -p $pkgdir/usr/lib

  # ni-libraries
  pushd ni-libraries/build/outputs > /dev/null
  yes A | unzip -u -q nilibraries-classifier-headers.zip -d $pkgdir/usr/${_target}/include
  yes A | unzip -u -q -j nilibraries-classifier-linuxathena.zip -d $pkgdir/usr/${_target}/lib
  popd > /dev/null

  # HAL
  pushd hal/build/outputs > /dev/null
  unzip -u -q hal-headers.zip -d $pkgdir/usr/${_target}/include
  unzip -u -q hal-headers.zip -d $pkgdir/usr/include
  unzip -u -q -j zipcpphalAthena-classifier-linuxathena.zip -d $pkgdir/usr/${_target}/lib
  unzip -u -q -j zipcpphalSim-classifier-linuxx86-64.zip -d $pkgdir/usr/lib
  popd > /dev/null

  # wpilibc
  pushd wpilibc/build/outputs > /dev/null
  unzip -u -q wpilibc-headers.zip -d $pkgdir/usr/${_target}/include
  unzip -u -q wpilibc-headers.zip -d $pkgdir/usr/include
  unzip -u -q -j zipcppwpilibc-classifier-linuxathena.zip -d $pkgdir/usr/${_target}/lib
  unzip -u -q -j zipcppwpilibc-classifier-linuxx86-64.zip -d $pkgdir/usr/lib
  popd > /dev/null
  cp wpilibc/build/libwpi.so $pkgdir/usr/${_target}/lib

  find $pkgdir -type f -name LICENSE.txt -exec rm {} \;

  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/${_target}-wpilib/LICENSE
}
