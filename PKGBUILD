# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=('uavcan-git' 'libuavcan-git')
_gitname=uavcan
pkgver=1030.f9b946a
pkgrel=3
pkgdesc="UAVCAN is a lightweight protocol designed for reliable communication in aerospace and robotic applications via CAN bus (git version)"
arch=('i686' 'x86_64')
url="http://uavcan.org"
license=('MIT')
depends=('')
optdepends=('can-utils')
makedepends=('git' 'make' 'cmake')
options=(!strip)
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

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package_uavcan-git() {
  provides=('uavcan')
  conflicts=('uavcan')

  make -C "$srcdir/${_gitname}/build" DESTDIR=${pkgdir} install

  # FIXME: there has to be a way to do a more selective install
  rm -rf ${pkgdir}/usr/include \
         ${pkgdir}/usr/share \
         ${pkgdir}/usr/src \
         ${pkgdir}/usr/lib
}

package_libuavcan-git() {
  provides=('libuavcan')
  conflicts=('libuavcan')

  make -C "$srcdir/${_gitname}/build" DESTDIR=${pkgdir} install

  cd "$srcdir/${_gitname}/libuavcan/dsdl_compiler"
  python setup.py install --skip-build -O1 --root="$pkgdir"


  # FIXME: there has to be a way to do a more selective install
  rm -rf ${pkgdir}/usr/bin
}
