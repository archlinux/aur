# Maintainer: Donald Carr <sirspudd@gmail.com>

#set -e

_qmake="qmake"
_piver=""

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -n "$_piver" ]]; then
  _qmake="/opt/qt-sdk-raspberry-pi${_piver}/bin/qmake"
fi

pkgname="quint"
pkgver=.0.1
pkgrel=1
pkgdesc="Live coding demo for the Raspberry Pi"
arch=("any")
url="https://github.com/sirspudd/quint"
makedepends=("qt-sdk-raspberry-pi${_piver}")
depends=("qt-sdk-raspberry-pi-target-libs")
source=("git://github.com/sirspudd/${pkgname}.git")
sha256sums=("SKIP")
options=('!strip')

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local repo_src=${srcdir}/${pkgname}

  cd ${repo_src}
  $_qmake
  make
}

package() {
  local repo_src=${srcdir}/${pkgname}
  local deploy_path=${pkgdir}/opt/${pkgname}
  local systemd_deploy_path=${pkgdir}/usr/lib/systemd/system

  mkdir -p $deploy_path
  mkdir -p $systemd_deploy_path

  cp ${repo_src}/${pkgname} ${deploy_path}
  cp ${startdir}/*.service ${systemd_deploy_path}
}
