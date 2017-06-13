# Maintainer: Donald Carr<sirspudd at gmail dot com>

_qmake="qmake"
_piver=""

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -n "$_piver" ]]; then
  _qmake="/opt/qt-sdk-raspberry-pi${_piver}/bin/qmake"
fi

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=artriculate
pkgver=0.4.r0.g9d27639
pkgrel=1
pkgdesc='QML box2d application for displaying artwork'
arch=('any')
url='https://github.com/sirspudd/artriculate'
license=('GPL3')
makedepends=("qt-sdk-raspberry-pi${_piver}")
depends=('qt-sdk-raspberry-pi-target-libs')
source=("git://github.com/sirspudd/artriculate")
sha256sums=('SKIP')
options=('!strip')

pkgver () {
  cd "$srcdir/$pkgname"

  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"$pkgname"
  $_qmake
  make
}

package() {
  local _repo_src=${srcdir}/${pkgname}
  local _systemd_deploy_path=${pkgdir}/usr/lib/systemd/system
  local _bin_path=${pkgdir}/usr/bin

  mkdir -p $_systemd_deploy_path $_qml_deploy_path $_bin_path
  cp ${_repo_src}/artriculate $_bin_path
  cp ${_repo_src}/src/resources/*.service ${_systemd_deploy_path}

  cd ${_repo_src}
  INSTALL_ROOT="$pkgdir" make install
}
