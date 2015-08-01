# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=arm-frc-linux-gnueabi-wpilib-git
pkgver=1099.f0e3bb5
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
        "0001-Fixed-build-failures-introduced-by-43f1651.-Headers-.patch")
sha512sums=('SKIP'
            'cad43e25abd72403fffde532e0a6766509ecff9165f1ca1f50b5973f2df3bbe3655332a7f458401855cc21835acf54a95719c4f9bb932d224bbb8df747463183')

pkgver() {
  cd allwpilib
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/allwpilib"

  # Apply upstream patches
  patch -p1 < ../0001-Fixed-build-failures-introduced-by-43f1651.-Headers-.patch
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
