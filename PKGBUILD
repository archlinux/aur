#!/usr/bin/env bash
# Maintainer: Rob Shinn <rob d0t shinn at gmail dotcom> 

pkgname=autodafe
pkgver=0.5
pkgrel=3
pkgdesc='Tools for converting an autotools recipe to a plain Makefile.'
arch=('any')
license=('BSD-2-Clause')
url="http://www.catb.org/~esr/autodafe"
makedepends=('git' 'asciidoctor')
depends=('python3')
source=("https://gitlab.com/esr/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7b8b7aa7a9c3aa7738ee2cdbdda3d1b40c1abc355e3e0d0f9cc13dae162fc856')
_docs=('NEWS' 'README' 'TODO' 'de-autoconfiscation' 'hacking' 'configure')
_htmldocs=('NEWS.html' 'README.html' 'TODO.html' 'de-autoconfiscation.html' 'deconfig.html' 'hacking.html' 'configure.html' 'makemake.html')

build() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
  make configure.1
  make deconfig.1
  for i in ${_docs[@]}; do
    asciidoctor $i.adoc
  done
}

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" prefix=/usr make install
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}"/configure "${pkgdir}"/usr/bin/configure
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/configure.1 "${pkgdir}"/usr/share/man/man1/configure.1
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}"/deconfig "${pkgdir}"/usr/bin/deconfig
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/deconfig.1 "${pkgdir}"/usr/share/man/man1/deconfig.1
  for i in ${_htmldocs[@]}; do
    install -Dm644 "${srcdir}/${pkgname}"/$i "${pkgdir}"/usr/share/doc/${pkgname}/$i 
  done
}
