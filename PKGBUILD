# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=arm-frc-linux-gnueabi-wpilib-git
pkgver=1081.eb7d55f
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
        "0001-artf4155-Move-Port.h-from-hal-lib-Athena-to-hal-incl.patch"
        "0001-Fix-std-unique_ptrs-using-incomplete-types.patch")
sha512sums=('SKIP'
            '3dbf006ccf7c96a58c6b5a0ad446b40d60b6cc1962b876c7cbc0ed041f34a4f17dc3848bfff183ee9258466103940e80935ccfdc3f6d0da762c01f0be023e338'
            'b83b9bd1d19efc17a961ae0b73f91cb5e48506f25a5f51bdea53827676fbbebdc45f24223b97633cf6d34d6bad8434f52e40326dc316c47335e05ec01218ca27')

pkgver() {
  cd allwpilib
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/allwpilib"
  patch -p1 < ../0001-artf4155-Move-Port.h-from-hal-lib-Athena-to-hal-incl.patch
  patch -p1 < ../0001-Fix-std-unique_ptrs-using-incomplete-types.patch
}

build() {
  cd "$srcdir/allwpilib"
  mkdir build && cd build
  cmake .. -DCMAKE_TOOLCHAIN_FILE=../arm-toolchain.cmake
  make ${MAKEFLAGS} || return 1
}

package() {
  cd "$srcdir/allwpilib/build"
  make ${MAKEFLAGS} DESTDIR="${pkgdir}" install || return 1
  mv $pkgdir/usr/local $pkgdir/usr/arm-frc-linux-gnueabi
  install -Dm644 ../wpilibj/BSD_License_for_WPILib_code.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
