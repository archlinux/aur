# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Pajaro

pkgname=liblo-git
_basename=liblo
pkgver=0.29.r7.g5e0bda0
pkgrel=2
pkgdesc="A lightweight OSC (Open Sound Control) implementation"
arch=('i686' 'x86_64')
url="http://liblo.sourceforge.net/"
license=('GPL')
provides=('liblo=0.29')
conflicts=('liblo' 'liblo-ipv6')
makedepends=('doxygen')
source=("${_basename}::git+https://git.code.sf.net/p/${_basename}/git")
sha512sums=('SKIP')

pkgver() {
  cd "${_basename}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${_basename}"
  # keep autoreconf happy
  cp README.md README
  autoreconf -f -i
}

build() {
  cd "${_basename}"
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${_basename}"
  mkdir -p "${pkgdir}"/usr/share/{man/man3,doc/"${_basename}"/{html,latex},"${_basename}"/examples}
  make DESTDIR="${pkgdir}" install

  # delete broken man pages
  rm doc/man/man3/_*.3
  # move all doc
  install -Dm 644 doc/html/* "${pkgdir}/usr/share/doc/${_basename}/html"
  install -Dm 644 doc/latex/* "${pkgdir}/usr/share/doc/${_basename}/latex"
  install -Dm 644 doc/man/man3/*.3 "${pkgdir}/usr/share/man/man3"
  install -Dm 644 examples/*.{cpp,c} "${pkgdir}/usr/share/${_basename}/examples"
}

# vim:set ts=2 sw=2 et:
