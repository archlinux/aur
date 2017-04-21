# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=kdiff
pkgname=${_pkgname}-git
pkgver=r5.bd62738
pkgrel=1
pkgdesc="Graphical difference viewer for the KDE platform. (GIT version)"
url="https://github.com/jsalatas/kdiff"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libkomparediff2-git' 'ktexteditor' 'desktop-file-utils')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/jsalatas/${_pkgname}.git")
sha1sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  #sed 's|${DATA_INSTALL_DIR}|${KXMLGUI_INSTALL_DIR}|g' -i kdiff{,/kdiffpart}/CMakeLists.txt
}

build() {
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir} install
}
