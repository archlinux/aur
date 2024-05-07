#!/usr/bin/env bash
# Maintainer: Rob Shinn <rob.shinn@gmail.com> 

pkgname=autodafe-git
pkgver=0.5.r21.ge8290ae
pkgrel=1
pkgdesc='Tools for converting an autotools recipe to a plain Makefile.'
provides=('autodafe')
conflicts=('autodafe')
arch=('any')
license=('BSD-2-Clause')
url="http://www.catb.org/~esr/autodafe"
makedepends=('git' 'asciidoctor')
depends=('python3')
source=("git+https://gitlab.com/esr/autodafe")
sha256sums=('SKIP')
_pkgname=autodafe
_docs=('NEWS' 'README' 'TODO' 'de-autoconfiscation' 'hacking' 'configure')
_htmldocs=('NEWS.html' 'README.html' 'TODO.html' 'de-autoconfiscation.html' 'deconfig.html' 'hacking.html' 'configure.html' 'makemake.html')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() { 
  cd "${srcdir}/${_pkgname}"
  make all
  make configure.1
  make deconfig.1
  for i in ${docs[@]}; do
    asciidoctor $i.adoc
  done
}

package() {  
  cd "${srcdir}/${_pkgname}"
  DESTDIR="$pkgdir" prefix=/usr make install
  install -Dm755 "${srcdir}/${_pkgname}"/configure "${pkgdir}"/usr/bin/configure
  install -Dm644 "${srcdir}/${_pkgname}"/configure.1 "${pkgdir}"/usr/share/man/man1/configure.1
  install -Dm755 "${srcdir}/${_pkgname}"/deconfig "${pkgdir}"/usr/bin/deconfig
  install -Dm644 "${srcdir}/${_pkgname}"/deconfig.1 "${pkgdir}"/usr/share/man/man1/deconfig.1
  for i in ${htmldocs[@]}; do
    install -Dm644 "${srcdir}/${_pkgname}"/$i "${pkgdir}"/usr/share/doc/${pkgname}/$i 
  done
}

