# Contributer: Donald Carr <sirspudd@gmail.com>

set -e

_pi_ver=2
pkgname="qcec"
pkgver=0.0.1
pkgrel=3
provides=("$pkgname")
conflicts=("$pkgname")
pkgdesc="Qt CEC keyboard plugin for the Raspberry Pi"
arch=("any")
url="http://www.github.com/sirspudd/qcec"
license=("GPL3")
makedepends=("qt-sdk-raspberry-pi${_pi_ver}")
depends=("qt-sdk-raspberry-pi-target-libs")
source=("git://github.com/sirspudd/${pkgname}.git")
sha256sums=("SKIP")
options=('!strip')

build() {
  local repo_src=${srcdir}/${pkgname}
  local qmake=/opt/qt-sdk-raspberry-pi${_pi_ver}/bin/qmake

  # cmake gets thrown by env vars
  unset LDFLAGS
  unset CFLAGS
  unset CXXFLAGS

  cd ${repo_src}
  $qmake
  make
}

package() {
  local repo_src=${srcdir}/${pkgname}
  local deploy_path=${pkgdir}/opt/qt-sdk-raspberry-pi${_pi_ver}/plugins/generic
  local ceclib_deploy_path=${pkgdir}/usr/lib
  local pkgprofiled="${pkgdir}/etc/profile.d"

  mkdir -p ${deploy_path}
  mkdir -p ${ceclib_deploy_path}
  mkdir -p ${pkgprofiled}

  cp ${repo_src}/out/* ${deploy_path}
  cp -a ${repo_src}/local/lib/libcec* ${ceclib_deploy_path}
  cp ${startdir}/qcec.sh ${pkgprofiled} || exit 1
}
