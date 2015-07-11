# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=arm-frc-linux-gnueabi-wpilib-git
pkgver=1073.7f5ee01
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
source=("git+https://usfirst.collab.net/gerrit/allwpilib"
        "0001-artf4155-Move-Port.h-from-hal-lib-Athena-to-hal-incl.patch")
sha512sums=('SKIP'
            '18a6e1f492b28eaa913b7aebe168ce349824092c3ce6792fad569ea5604a8382bb69e2a0a17732291f8f5bd25270bff19890f5af8b918d55025d3730dd76590a')

pkgver() {
  cd allwpilib
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/allwpilib"
  patch -p1 < ../0001-artf4155-Move-Port.h-from-hal-lib-Athena-to-hal-incl.patch
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
