#!/bin/bash
### Above line for automatic syntax highlighting editors.

# Maintainer: dreieck.

_pkgname="solunar"
pkgname=solunar-git
_pkgver="latest"
pkgver=0.1.3a
pkgrel=1
pkgdesc="A simple command-line utility for calculating Sun and Moon rise and set, and related times."
arch=('i686' 'x86_64')
url='http://kevinboone.net/README_solunar.html'
depends=('glibc' 'tzdata')
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")
license=('GPL2')
source=(
        "${_pkgname}::git://github.com/kevinboone/solunar_cmdline"
       )
sha256sums=('SKIP')

pkgver() {
  _extractdir="${srcdir}/solunar"
  
  sed -n -r 's|^[[:space:]]*VERSION[[:space:]]*=[[:space:]]*([^[[:space:]]*)[[:space:]]*|\1|p' "${_extractdir}/Makefile" | head -n1
}

build() {
  _extractdir="${srcdir}/solunar"
  echo ""
  echo ">>> Building '${pkgname}', version '${pkgver}'. >>>"
  echo ""

  cd "${_extractdir}"

  make

  echo ""
  echo "<<< Finished building '${pkgname}', version '${pkgver}'. <<<"
  echo ""
}

package() {
  _extractdir="${srcdir}/solunar"
  _instdir="/usr/bin"
  _docinstdir="/usr/share/doc/${_pkgname}"
  
  cd "${_extractdir}"
  
  ### Not use 'make install', since that will not install below '${pkgdir}'. 'make DESTDIR="${pkgdesc}"' seems not to work either.
  install -v -D -m755 solunar "${pkgdir}/${_instdir}/solunar"
  
  for _docfile in README_solunar.html NOTES TODO; do 
    if [ -f "${_docfile}" ]; then
      install -v -D -m644 "${_docfile}" "${pkgdir}/${_docinstdir}/${_docfile}"
    fi
  done
}
