# Maintainer: Donald Carr <d@chaos-reins dot com>

_qmake="qmake"
_piver=""

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -n "$_piver" ]]; then
  _qmake="/opt/qt-sdk-raspberry-pi${_piver}/bin/qmake"
  depends=('qt-sdk-raspberry-pi-target-libs')
  makedepends=("qt-sdk-raspberry-pi${_piver}")
else
  depends=(qt5-base)
  makedepends=(git)
fi

_pkgname=qmlbench
pkgname=${_pkgname}-git
pkgver=r131.a54f075
pkgrel=1
arch=('any')
pkgdesc='QML benchmarking tool'
url='https://github.com/CrimsonAS/qmlbench'
license=(GPL3)
provides=(qmlbench)
conflicts=(qmlbench)
source=("git://github.com/CrimsonAS/qmlbench.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  ${_qmake}
  make
}

package() {
  cd ${_pkgname}
  temp_dir=$(mktemp -d) 
  target_path=${pkgdir}/opt/qmlbench
  mkdir -p ${target_path}

  INSTALL_ROOT="${temp_dir}" make install
  mv ${temp_dir}/root/* ${target_path}
}
