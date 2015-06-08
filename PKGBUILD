# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=arm-frc-linux-gnueabi-wpilib-git
pkgver=935.87e1df0
pkgrel=1
pkgdesc="The WPI FIRST Robotics Competition C/C++ library for the arm-frc-linux-gnueabi toolchain"
arch=(i686 x86_64)
provides=('arm-frc-linux-gnueabi-wpilib')
url="https://usfirst.collab.net/sf/projects/wpilib/"
license=('custom=FRC-BSD')
groups=('frc-2015')
depends=('arm-frc-linux-gnueabi-gcc')
makedepends=('cmake' 'git')
options=('!strip' 'libtool' 'staticlibs')
source=("git+https://usfirst.collab.net/gerrit/allwpilib")
sha512sums=('SKIP')

pkgver() {
  cd allwpilib
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/allwpilib"
  mkdir build && cd build
  cmake .. -DCMAKE_TOOLCHAIN_FILE=../arm-toolchain.cmake
  make ${MAKEFLAGS} || return 1
}

package () {
  cd "$srcdir/allwpilib/build"
  make ${MAKEFLAGS} DESTDIR="${pkgdir}" install || return 1
  mv $pkgdir/usr/local $pkgdir/usr/arm-frc-linux-gnueabi
  install -Dm644 ../wpilibj/BSD_License_for_WPILib_code.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
