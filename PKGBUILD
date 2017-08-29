# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=arm-frc-linux-gnueabi-wpilib
pkgver=2017.3.1
pkgrel=3
pkgdesc="The WPI FIRST Robotics Competition C/C++ library for the arm-frc-linux-gnueabi toolchain"
arch=(i686 x86_64)
url="https://usfirst.collab.net/sf/projects/wpilib/"
license=('custom=FRC-BSD')
groups=('frc-toolchain')
depends=('arm-frc-linux-gnueabi-gcc' 'gazebo')
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

  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include

  # HAL includes
  cp -r hal/include/* $pkgdir/usr/include

  # Documentation
  cd "$srcdir/allwpilib/wpilibc/build"
  mkdir -p $pkgdir/usr/arm-frc-linux-gnueabi/share/doc/wpilib
  yes A | unzip -d $pkgdir/usr/arm-frc-linux-gnueabi/share/doc/wpilib distributions/wpilibc.zip

  yes A | unzip -d $pkgdir/usr/arm-frc-linux-gnueabi wpilibc.zip

  install -Dm644 ../../license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
