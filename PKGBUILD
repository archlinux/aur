# Maintainer: Donald Carr<sirspudd at gmail dot com>

# NB: requires/assumes Qt > 5.8 for compile

#set -x

_piver=""

if [[ -z $_qmake ]]; then
  if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
    _piver=$LOCAL_PI_VER
  fi

  if [[ -n "$_piver" ]]; then
    _qmake="/opt/qt-sdk-raspberry-pi${_piver}/bin/qmake"
  fi

  if [[ -z "$_qmake" ]]; then
    _qmake="qmake"
  fi
fi

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"

pkgname=qml-presentation-system
pkgver=0.1
pkgrel=1
pkgdesc='QML presentation system'
arch=('any')
url='https://github.com/qt-labs/qml-presentation-system'
license=('LGPL')
depends=('qt5-declarative')
makedepends=('gcc' 'qt5-base')
source=("git://github.com/qt-labs/qml-presentation-system")
sha256sums=('SKIP')
options=('!strip')

build() {
  cd "$srcdir/$pkgname"

  touch .qmake.conf
  ${_qmake}
}

package() {
  cd "$srcdir/$pkgname"

if [[ -n "$_piver" ]]; then
  local temp_pkgdir="$srcdir/refactor_package"
  rm -Rf $temp_pkgdir
  mkdir $temp_pkgdir
  INSTALL_ROOT="$temp_pkgdir" make install
  mv ${temp_pkgdir}/mnt/pi${_piver}/* $pkgdir
else
  DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" make install
fi

  mkdir -p ${pkgdir}/opt
  mv examples ${pkgdir}/opt/qml-box2d-examples
}
