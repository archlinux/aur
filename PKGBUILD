# Maintainer: David Runge <dave@sleepmap.de>

_basename=jackcpp
pkgname=jackcpp-git
pkgver=r23.488554c
pkgrel=5
pkgdesc="Some c++ classes which wrap the Jack audio io api and lock-free ring buffer."
url="https://github.com/x37v/jackcpp"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL3')
depends=('jack' 'swig')
makedepends=('git' 'doxygen')
provides=('jackcpp')
source=("git+https://github.com/x37v/jackcpp.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_basename}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${_basename}"
  make
  cd "${srcdir}/${_basename}/doc"
  doxygen
}

package() {
  cd "${_basename}"
  mkdir -p "${pkgdir}"/usr/{include,lib,share/doc/"${_basename}"/{html,latex}}
  make PREFIX="/usr" DESTDIR="${pkgdir}/" install
  install -Dm 644 src/* "${pkgdir}/usr/lib"
  install -Dm 644 doc/html/* "${pkgdir}/usr/share/doc/${_basename}/html"
  install -Dm 644 doc/latex/* "${pkgdir}/usr/share/doc/${_basename}/latex"
}

