# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=edi
pkgname=${_pkgname}-git
pkgver=f80b901
pkgrel=1
pkgdesc="The EFL IDE"
arch=('i686' 'x86_64')
url="https://phab.enlightenment.org/w/projects/${_pkgname}/"
license=('GPL2')
depends=('efl' 'elementary')
makedepends=('git')
source=("git://git.enlightenment.org/tools/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  if ! pacman -Qs '^clang$' &>/dev/null; then
    warning "To enable syntax highlighting in edi, please install clang before building this package"
  fi

  cd "${srcdir}/${_pkgname}"

  ./autogen.sh --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_pkgname}"

  make check
}

package() {
  if pacman -Qs '^clang$' &>/dev/null; then
    depends+=('clang')
  fi

  cd "${srcdir}/${_pkgname}"
  
  make install DESTDIR=$pkgdir
}
