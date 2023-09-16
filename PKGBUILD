# Maintainer:  Lyle Tafoya <lyle.tafoya@gmail.com>

pkgname=omega-rebirth-git
pkgver=v0.3.0.r0.g2b98b5d
pkgrel=1
pkgdesc='Modern fork of the classic 1987 roguelike "Omega"'
arch=('i686' 'x86_64')
url='https://github.com/Lyle-Tafoya/Omega'
license=('GPL')
depends=('ncurses')
makedepends=('git')
source=('git+https://github.com/Lyle-Tafoya/Omega.git')
sha256sums=('SKIP')
provides=('omega-rebirth')
conflicts=('omega-rebirth')

pkgver() {
  cd Omega
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir "${srcdir}/Omega/build"
  cd "${srcdir}/Omega/build"
  sed -i 's|#define OMEGALIB.*|#define OMEGALIB "/var/games/omega-rebirth/"|' "${srcdir}/Omega/src/defs.h"
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/Omega
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/var/games"
  cp "${srcdir}/Omega/build/omega" "${pkgdir}/usr/bin/omega-rebirth"
  cp -r "${srcdir}/Omega/build/lib" "${pkgdir}/var/games/omega-rebirth"
  chown -R root:games "${pkgdir}/var/games"
  chmod 0755 "${pkgdir}/usr/bin/omega-rebirth"
  chmod -R 0775 "${pkgdir}/var/games/"
}
