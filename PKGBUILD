# Maintainer:  Lyle Tafoya <lyle.tafoya@gmail.com>

pkgname=omega-rebirth-git
pkgver=v0.5.0.r0.g78c89a4
pkgrel=0
pkgdesc='Modern fork of the classic 1987 roguelike "Omega"'
arch=('i686' 'x86_64')
url='https://github.com/Lyle-Tafoya/Omega'
license=('GPL')
depends=('ncurses')
makedepends=('git' 'cmake' 'gzip')
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
  cmake .. -DCMAKE_BUILD_TYPE='Release' -DCMAKE_CXX_FLAGS='-DOMEGALIB=\"/var/games/omega-rebirth/\"'
  cmake --build .
}

package() {
  install -Dm755 "${srcdir}/Omega/build/omega" "${pkgdir}/usr/bin/omega-rebirth"
  install -dm775 "${pkgdir}/var/games"
  mv "${srcdir}/Omega/build/lib" "${pkgdir}/var/games/omega-rebirth"
  install -dm775 "${pkgdir}/var/games/omega-rebirth/saves"
  chown -R root:games "${pkgdir}/var/games/"
  chmod 775 "${pkgdir}/var/games/omega-rebirth"
  find "${pkgdir}/var/games/omega-rebirth" -type f -exec chmod 664 {} \;
  gzip "${srcdir}/Omega/docs/omega.6"
  install -Dm644 "${srcdir}/Omega/docs/omega.6.gz" "${pkgdir}/usr/share/man/man6/omega.6.gz"
}
