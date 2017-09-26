# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target=arm-frc-linux-gnueabi
pkgname=${_target}-wpilib
pkgver=2017.3.1
pkgrel=4
pkgdesc="The WPI FIRST Robotics Competition C/C++ library for the arm-frc-linux-gnueabi toolchain"
arch=(i686 x86_64)
url="https://usfirst.collab.net/sf/projects/wpilib/"
license=('custom=FRC-BSD')
groups=('frc-toolchain')
depends=("${_target}-gcc")
makedepends=('git' 'java-environment=8' 'doxygen' 'unzip')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("git+git://github.com/wpilibsuite/allwpilib#tag=v2017.3.1")
sha512sums=('SKIP')

build() {
  cd "$srcdir/allwpilib"
  ./gradlew build
  ./gradlew wpilibcZip
  ./gradlew doxygenZip
}

package() {
  cd "$srcdir/allwpilib"

  mkdir -p $pkgdir/usr/${_target}/include
  mkdir -p $pkgdir/usr/${_target}/lib

  # HAL
  pushd hal/build > /dev/null
  unzip -u -q athena-runtime.zip include/* -d $pkgdir/usr/${_target}
  unzip -u -q athena-runtime.zip lib/* -d $pkgdir/usr/${_target}
  unzip -u -q hal.zip lib/* -d $pkgdir/usr/${_target}
  popd > /dev/null

  # wpilibc
  pushd wpilibc/build > /dev/null
  unzip -u -q wpilibc.zip -d $pkgdir/usr/arm-frc-linux-gnueabi

  mkdir -p $pkgdir/usr/${_target}/share/doc/wpilib
  unzip -u -q distributions/wpilibc.zip -d $pkgdir/usr/${_target}/share/doc/wpilib
  popd > /dev/null

  # dependencies
  pushd build/dependencies > /dev/null
  cp -r cscore/include/* $pkgdir/usr/${_target}/include
  cp -r cscore/lib/* $pkgdir/usr/${_target}/lib
  popd > /dev/null

  install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
