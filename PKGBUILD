# Maintainer: Donald Carr<sirspudd at gmail dot com>

#set -x

_qmake="qmake"
_piver=""

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -n "$_piver" ]]; then
  _qmake="/opt/qt-sdk-minimal-raspberry-pi${_piver}/bin/qmake"
fi

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"

_pkgname=qml-box2d
pkgname=${_pkgname}-git
pkgver=2.3.2
pkgrel=3
pkgdesc='Box2D QML bindings'
arch=('any')
url='https://github.com/qml-box2d/qml-box2d/blob/master/README'
license=('GPL')
source=("git://github.com/qml-box2d/qml-box2d")
sha256sums=('SKIP')
options=('!strip')

if [[ -n "$_piver" ]]; then
  depends=('qt-sdk-raspberry-pi-target-libs')
  makedepends=("qt-sdk-minimal-raspberry-pi${_piver}")
else
  depends=('qt5-declarative')
  makedepends=('gcc' 'qt5-base')
fi

build() {
  cd "$srcdir/$_pkgname"
  ${_qmake}
  make
}

package() {
  cd "$srcdir/$_pkgname"

if [[ -n "$_piver" ]]; then
  local temp_pkgdir="$srcdir/refactor_package"
  rm -Rf $temp_pkgdir
  mkdir $temp_pkgdir
  INSTALL_ROOT="$temp_pkgdir" make install
  mv ${temp_pkgdir}/mnt/pi${_piver}/* $pkgdir
else
  INSTALL_ROOT="$pkgdir" make install
fi

  mkdir -p ${pkgdir}/opt
  mv examples ${pkgdir}/opt/qml-box2d-examples
}
