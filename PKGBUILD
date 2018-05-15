# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-wpilib-git
pkgver=3016.1d6eb629a
pkgrel=1
pkgdesc="The WPI FIRST Robotics Competition C/C++ library for the arm-frc-linux-gnueabi toolchain"
arch=(i686 x86_64)
conflicts=("${_target}-wpilib")
provides=("${_target}-wpilib")
url="https://github.com/wpilibsuite/allwpilib"
license=('custom=FRC-BSD')
depends=("${_target}-gcc")
makedepends=('git' 'java-environment=8' 'unzip')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("git+git://github.com/wpilibsuite/allwpilib")
sha512sums=('SKIP')

pkgver() {
  cd allwpilib
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

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
  yes A | unzip -u -q _GROUP_edu_wpi_first_ni-libraries_ID_ni-libraries_CLS-headers.zip -d $pkgdir/usr/${_target}/include
  yes A | unzip -u -q -j _GROUP_edu_wpi_first_ni-libraries_ID_ni-libraries_CLS-linuxathena.zip -d $pkgdir/usr/${_target}/lib
  popd > /dev/null

  # HAL
  pushd hal/build/outputs > /dev/null
  unzip -u -q _GROUP_edu_wpi_first_hal_ID_hal-cpp_CLS-headers.zip -d $pkgdir/usr/${_target}/include
  unzip -u -q _GROUP_edu_wpi_first_hal_ID_hal-cpp_CLS-headers.zip -d $pkgdir/usr/include
  unzip -u -q -j _M__GROUP_edu_wpi_first_hal_ID_hal-cpp_CLS-linuxathena.zip -d $pkgdir/usr/${_target}/lib
  unzip -u -q -j _M__GROUP_edu_wpi_first_hal_ID_hal-cpp_CLS-linuxx86-64.zip -d $pkgdir/usr/lib
  popd > /dev/null

  # wpilibc
  pushd wpilibc/build/outputs > /dev/null
  unzip -u -q _GROUP_edu_wpi_first_wpilibc_ID_wpilibc_CLS-headers.zip -d $pkgdir/usr/${_target}/include
  unzip -u -q _GROUP_edu_wpi_first_wpilibc_ID_wpilibc_CLS-headers.zip -d $pkgdir/usr/include
  unzip -u -q -j _GROUP_edu_wpi_first_wpilibc_ID_wpilibc-linkscripts_CLS-linuxathena.zip -d $pkgdir/usr/${_target}/lib
  unzip -u -q -j _M__GROUP_edu_wpi_first_wpilibc_ID_wpilibc_CLS-linuxathena.zip -d $pkgdir/usr/${_target}/lib
  unzip -u -q -j _M__GROUP_edu_wpi_first_wpilibc_ID_wpilibc_CLS-linuxx86-64.zip -d $pkgdir/usr/lib
  popd > /dev/null

  find $pkgdir -type f -name LICENSE.txt -exec rm {} \;

  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/${_target}-wpilib/LICENSE
}
