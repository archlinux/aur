# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=arm-frc-linux-gnueabi-wpilib-git
pkgver=1713.bc7ab176
pkgrel=1
pkgdesc="The WPI FIRST Robotics Competition C/C++ library for the arm-frc-linux-gnueabi toolchain"
arch=(i686 x86_64)
conflicts=('arm-frc-linux-gnueabi-wpilib')
provides=('arm-frc-linux-gnueabi-wpilib')
url="https://usfirst.collab.net/sf/projects/wpilib/"
license=('custom=FRC-BSD')
depends=('arm-frc-linux-gnueabi-gcc' 'gazebo')
makedepends=('git' 'java-environment=8' 'doxygen' 'unzip')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("git+git://github.com/wpilibsuite/allwpilib")
sha512sums=('SKIP')

pkgver() {
  cd allwpilib
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/allwpilib"
  ./gradlew build -PmakeSim
  ./gradlew wpilibcZip
  ./gradlew doxygenZip
}

package() {
  cd "$srcdir/allwpilib"

  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include

  # Simulation libs
  cp build/install/simulation/lib/* $pkgdir/usr/lib
  cp build/install/simulation/plugins/* $pkgdir/usr/lib
  cp build/simulation/gz_msgs/libgz_msgs.so $pkgdir/usr/lib

  # Simulation includes
  cp -r wpilibc/shared/include/* wpilibc/sim/include/* $pkgdir/usr/include
  mkdir -p $pkgdir/usr/include/simulation/gz_msgs
  cp -r build/simulation/gz_msgs/generated/simulation/gz_msgs/*.h $pkgdir/usr/include/simulation/gz_msgs

  # HAL includes
  cp -r hal/include/* $pkgdir/usr/include

  # Documentation
  cd "$srcdir/allwpilib/wpilibc/build"
  mkdir -p $pkgdir/usr/arm-frc-linux-gnueabi/share/doc/wpilib
  yes A | unzip -d $pkgdir/usr/arm-frc-linux-gnueabi/share/doc/wpilib distributions/wpilibc.zip

  yes A | unzip -d $pkgdir/usr/arm-frc-linux-gnueabi wpilibc.zip

  install -Dm644 ../../license.txt $pkgdir/usr/share/licenses/arm-frc-linux-gnueabi-wpilib/LICENSE
}
