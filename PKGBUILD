# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>
pkgname=frc-wpilib-git
pkgver=88.f609b8b
pkgrel=2
pkgdesc="The WPI FIRST Robotics Competition C/C++ library for the VxWorks 6.3 GCC Toolchain"
arch=(any)
provides=('frc-wpilib')
conflicts=('frc-gcc-tools' 'frc-wpilib')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('custom=FRC-BSD')
depends=()
makedepends=('gcc-powerpc-wrs-vxworks' 'frcmake-git')
options=('!strip' 'libtool' '!zipman' 'staticlibs')
_azalea="wpilib-azalea"
source=("git+https://bitbucket.org/frc-cpp11/"$_azalea".git")
sha512sums=('SKIP')

pkgver() {
  cd "$_azalea"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  source /etc/profile.d/wind_base.sh
  cd "$srcdir/$_azalea"
  mkdir build && cd build
  frcmake-wrs ..
  make ${MAKEFLAGS} || return 1
}

package () {
  cd "$srcdir/$_azalea/build"
  make ${MAKEFLAGS} DESTDIR="${pkgdir}" install || return 1
  ln -s /usr/powerpc-wrs-vxworks/lib/libwpilib.a $pkgdir/usr/powerpc-wrs-vxworks/lib/libWPILib.a
  install -Dm644 ../BSD_License_for_WPILib_code.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
