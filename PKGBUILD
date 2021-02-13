#!/bin/bash
### Above line for automatic syntax highlighting editors.

# Maintainer: dreieck.

_pkgname="solunar"
pkgname=solunar-git
_pkgver="latest"
pkgver=0.1.3d.d20200626.r3621219
pkgrel=1
pkgdesc="A simple command-line utility for calculating Sun and Moon rise and set, and related times."
arch=('i686' 'x86_64')
url='https://github.com/kevinboone/solunar_cmdline'
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
  cd "${_extractdir}"
  
  _ver="$(sed -n -r 's|^[[:space:]]*VERSION[[:space:]]*=[[:space:]]*([^[[:space:]]*)[[:space:]]*|\1|p' Makefile | head -n1)"
  _rev="$(git log -n 1 --format=tformat:%h)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
    
  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." > /dev/stderr
    false
    return 1
  fi
  
  if [ -z "${_rev}" ]; then
    echo "$0: Error: Could not determine revision." > /dev/stderr
    false
    return 1
  fi
  
  if [ -z "${_date}" ]; then
    echo "$0: Error: Could not determine date of last commit." > /dev/stderr
    false
    return 1
  fi
  
  echo "${_ver}.d${_date}.r${_rev}"
}

prepare() {
  chmod 755 "${srcdir}/solunar/parse_zoneinfo.pl"
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
