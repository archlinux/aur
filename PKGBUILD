# Contributer: Donald Carr <sirspudd@gmail.com>

#set -e

_qmake="qmake"
_piver=""

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -n "$_piver" ]]; then
  _qmake="/opt/qt-sdk-raspberry-pi${_piver}/bin/qmake"
  makedepends=("qt-sdk-raspberry-pi${_piver}")
  depends=("qt-sdk-raspberry-pi-target-libs")
fi

_pkgname="skunkjuice"
pkgname="${_pkgname}-git"
pkgver=0.0.2.r2.gee9c258
pkgrel=1
pkgdesc="Rudimentary QML compositor branched off qtwayland/examples/wayland/pure-qml"
arch=("any")
url="http://www.qt.io"
license=("LGPL3" "GPL3")
source=("git://github.com/sirspudd/${_pkgname}.git")
sha256sums=("SKIP")
options=('!strip')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local repo_src=${srcdir}/${_pkgname}

  cd ${repo_src}
  $_qmake
  make clean
  make
}

package() {
  local repo_src=${srcdir}/${_pkgname}
  local deploy_path=${pkgdir}/opt/${_pkgname}
  local systemd_deploy_path=${pkgdir}/usr/lib/systemd/system

  mkdir -p $deploy_path
  mkdir -p $systemd_deploy_path

  cp ${repo_src}/${_pkgname} ${deploy_path}
  cp ${repo_src}/resources/*.service ${systemd_deploy_path}
}
