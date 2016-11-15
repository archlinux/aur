# Maintainer: Donald Carr <sirspudd at gmail dot com>

set -e

_qmake="qmake"
_piver=""

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -n "$_piver" ]]; then
  _qmake="/opt/qt-sdk-raspberry-pi${_piver}/bin/qmake"
fi

pkgname="qcec"
pkgver=0.2
pkgrel=1
pkgdesc="Qt CEC keyboard plugin for the Raspberry Pi"
arch=("any")
url="http://www.github.com/sirspudd/qcec"
license=("GPL3")
makedepends=("qt-sdk-raspberry-pi${_piver}")
depends=("qt-sdk-raspberry-pi-target-libs")
source=("git://github.com/sirspudd/${pkgname}.git#tag=${pkgver}")
sha256sums=("SKIP")
options=('!strip')

build() {
  local repo_src=${srcdir}/${pkgname}

  # cmake gets thrown by env vars
  unset LDFLAGS
  unset CFLAGS
  unset CXXFLAGS

  cd ${repo_src}
  $_qmake
  make
}

package() {
  local repo_src=${srcdir}/${pkgname}
  local deploy_path=${pkgdir}/opt/qt-sdk-raspberry-pi${_piver}/plugins/generic
  local ceclib_deploy_path=${pkgdir}/usr/lib
  local pkgprofiled="${pkgdir}/etc/profile.d"

  mkdir -p ${deploy_path}
  mkdir -p ${ceclib_deploy_path}
  mkdir -p ${pkgprofiled}

  cp ${repo_src}/out/* ${deploy_path}
  cp -a ${repo_src}/local/lib/libcec* ${ceclib_deploy_path}
  cp ${startdir}/qcec.sh ${pkgprofiled} || exit 1
}
