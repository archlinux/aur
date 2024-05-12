#!/usr/bin/env bash
# Maintainer: Rob Shinn <rob d0t shinn at gmail dotcom> 

pkgname=autodafe
pkgver=0.7
pkgrel=3
pkgdesc='Tools for converting an autotools recipe to a plain Makefile.'
arch=('any')
license=('BSD-2-Clause')
url="http://www.catb.org/~esr/autodafe"
makedepends=('git' 'asciidoctor')
depends=('python3')
source=("https://gitlab.com/esr/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ff57e193c137a61b6480f3cabcad2f3b10b67dff028725658f6a40ff41361068')
_docs=('NEWS' 'README' 'TODO' 'de-autoconfiscation' 'hacking' 'configure')

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
  for i in ${_docs[@]}; do
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/$i.html "${pkgdir}"/usr/share/doc/${pkgname}/$i.html
  done
}
