# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=powerkit-git
_pkgname=powerkit
pkgver=r258.70be27f
pkgrel=1
pkgdesc='A Lightweight Desktop Independent full featured power manager'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/rodlie/powerkit'
license=('BSD')
install='powerkit-git.install'
depends=('xscreensaver'
         'upower'
         'qt5-base'
         'libxss')
provides=('powerkit')
conflicts=('powerkit')
makedepends=('xorg-xrandr' 'qt5-base' 'git' 'cmake')
optdepends=('adwaita-icon-theme')
source=("${_pkgname}::git+https://github.com/rodlie/powerkit")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DUSE_QT5=ON ..
  make 
}

package() {
  cd "${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
