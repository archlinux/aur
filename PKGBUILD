#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Brian BIdulock <bidulock@openss7.org>

pkgbase=sensible-utils
_pkgname='sensible-browser sensible-editor sensible-pager sensible-terminal'
declare -g -a pkgname=($_pkgname)
pkgname+=(sensible-utils sensible-utils-data)
pkgver=0.0.20
_debianextra=''
pkgrel=2
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="http://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash' 'coreutils')
makedepends=('po4a')
checkdepends=('ed' 'dash')
_dirname=${pkgbase}_${pkgver}_$pkgrel_${_debianextra}
source=("$_dirname.tar.xz::http://ftp.debian.org/debian/pool/main/s/$pkgbase/${pkgbase}_${pkgver}${_debianextra}.tar.xz"
        "$_dirname.dsc::http://ftp.debian.org/debian/pool/main/s/$pkgbase/${pkgbase}_${pkgver}${_debianextra}.dsc"
        sensible-utils_0.0.20_.dsc.asc)
b2sums=('e65419e7f157f64249b429806a4d48c02c5f492fb2dbdae1a8e4966dca964a4b1b9b6fdb555f03fabb6cd219238022821a64b15f11582ffdf115fa15ab6e3e0e'
        '8b122921916df3f4c138b99ac5183cae686e01be985db0ad2c77e3faff619779aecc596c6936c9f73f73ff3c73cf5ce30654df9158ce15caccd4ed0e0f50de09'
        'SKIP')
validpgpkeys=('98F28F767470129FBE3B054CE2154DD1A1C77B8B')

prepare() {
  return 0
}

build() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  export -n EDITOR VISUAL PAGER TERMINAL_EMULATOR BROWSER
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  test -L sh || ln -s /bin/dash sh
  OLDPATH="$PATH"
  export PATH=.:"$PATH"
  sed -i -e 's@#!/bin/sh@#!/usr/bin/env sh@' ./sensible-editor
  env -i make -k check
  sed -i -e 's@#!/usr/bin/env sh@#!/bin/sh@' ./sensible-editor
  export PATH="$OLDPATH"
}

_package_sensible() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  pkgdesc="$pkgdesc (${pkgname##*-})"
  depends+=(sensible-utils-data)
  [ "$pkgname" == sensible-utils-data ] && depends=(bash)
  export -n EDITOR VISUAL
  make DESTDIR="$pkgdir/" install
  shopt -s globstar
  cd "$pkgdir"
  find . -type f -and \( -not -iname "*$CURRENTLY_PACKAGING*" \) | xargs rm -v
}

package_sensible-pager() {
  CURRENTLY_PACKAGING=sensible-pager pkgdir="$pkgdir" _package_sensible
}

package_sensible-browser() {
  CURRENTLY_PACKAGING=sensible-browser pkgdir="$pkgdir" _package_sensible
}

package_sensible-editor() {
  CURRENTLY_PACKAGING=editor pkgdir="$pkgdir" _package_sensible
}

package_sensible-terminal() {
  CURRENTLY_PACKAGING=terminal pkgdir="$pkgdir" _package_sensible
}

package_sensible-utils-data() {
  CURRENTLY_PACKAGING=gettext pkgdir="$pkgdir" _package_sensible
}

package_sensible-utils() {
  pkgdesc="$pkgdesc (metapackage)"
  depends+=($_pkgname sensible-utils-data)
  mkdir -p "$pkgdir/usr/share/sensible-utils"
  echo 1 > "$pkgdir/usr/share/sensible-utils/.ARCH"
}

# vim:set ts=2 sw=2 et:
