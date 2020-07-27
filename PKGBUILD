# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=powerkit-git
_pkgname=powerkit
pkgver=r220.70c86aa
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
makedepends=('xorg-xrandr' 'qt5-base' 'git')
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
  qmake PREFIX=/usr CONFIG+=install_udev_rules CONFIG+=bundle_icons ..
  make 
}

package() {
  cd "${_pkgname}/build"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: