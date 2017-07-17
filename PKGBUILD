# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Pajaro

pkgname=liblo-git
_basename=liblo
pkgver=0.28.r86.ge0ec177
pkgrel=1
pkgdesc="A lightweight OSC (Open Sound Control) implementation"
arch=('i686' 'x86_64')
url="http://liblo.sourceforge.net/"
license=('GPL')
provides=('liblo=0.28')
conflicts=('liblo' 'liblo-ipv6')
makedepends=('doxygen')
source=("$_basename::git://liblo.git.sourceforge.net/gitroot/${_basename}/${_basename}")
sha256sums=('SKIP')

pkgver() {
  cd "${_basename}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_basename}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_basename}"
  mkdir -p ${pkgdir}/usr/share/{man/man3,doc/${_basename}/{html,latex},${_basename}/examples}
  make DESTDIR="$pkgdir" install

  # delete broken man pages
  rm $srcdir/${_basename}/doc/man/man3/_*.3
  # compress man pages
  for i in $srcdir/${_basename}/doc/man/man3/*
  do
    gzip -c $i > $i.gz
  done
  # move all doc
  install -Dm 644 $srcdir/${_basename}/doc/html/* ${pkgdir}/usr/share/doc/${_basename}/html
  install -Dm 644 $srcdir/${_basename}/doc/latex/* ${pkgdir}/usr/share/doc/${_basename}/latex
  install -Dm 644 $srcdir/${_basename}/doc/man/man3/*.3.gz ${pkgdir}/usr/share/man/man3
  install -Dm 644 $srcdir/${_basename}/examples/*.{cpp,c} ${pkgdir}/usr/share/${_basename}/examples

}

# vim:set ts=2 sw=2 et:
