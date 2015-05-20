# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=('uavcan-git' 'libuavcan-git')
_gitname=uavcan
pkgver=1030.f9b946a
pkgrel=1
pkgdesc="UAVCAN is a lightweight protocol designed for reliable communication in aerospace and robotic applications via CAN bus (git version)"
arch=('i686' 'x86_64')
url="http://uavcan.org"
license=('MIT')
depends=('')
optdepends=('can-utils')
makedepends=('git' 'make' 'cmake')
options=(!strip)
provides=('uavcan' 'libuavcan')
conflicts=('uavcan' 'libuavcan')
source=("${_gitname}::git+https://github.com/UAVCAN/uavcan.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/${_gitname}"

  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package_uavcan-git() {
  make -C "$srcdir/${_gitname}/build" DESTDIR=${pkgdir} install

  # FIXME: there has to be a way to do a more selective install
  rm -rf ${pkgdir}/usr/share \
      ${pkgdir}/usr/src \
      ${pkgdir}/usr/include \
      ${pkgdir}/usr/lib
}

package_libuavcan-git() {
  make -C "$srcdir/${_gitname}/build" DESTDIR=${pkgdir} install
  
  # FIXME: there has to be a way to do a more selective install
  rm -rf ${pkgdir}/usr/bin
}
