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
conflicts=('pi-launcher')
pkgver=0.3
pkgrel=1
pkgdesc='QML box2d application for displaying artwork'
arch=('any')
url='https://github.com/sirspudd/artriculate'
license=('GPL3')
depends=('qt5-declarative' 'qml-box2d')
source=("git://github.com/sirspudd/artriculate#tag=${pkgver}")
sha256sums=('SKIP')
options=('!strip')

build() {
  cd "$srcdir"/"$pkgname"
  $_qmake
  make
}

package() {
  local repo_src=${srcdir}/${pkgname}
  local systemd_deploy_path=${pkgdir}/usr/lib/systemd/system
  mkdir -p $systemd_deploy_path
  cp ${repo_src}/resources/*.service ${systemd_deploy_path}

  cd ${repo_src}
  INSTALL_ROOT="$pkgdir" make install
}
