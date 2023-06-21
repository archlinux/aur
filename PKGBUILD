#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: éclairevoyant
# Contributor: Brian BIdulock <bidulock@openss7.org>

pkgbase=sensible-utils
pkgname=(sensible-utils sensible-browser sensible-editor sensible-pager sensible-terminal sensible-utils-data)
# This is the above minus the pkgbase name, for use in sensible-utils packaging command.
_pkgname=(sensible-browser sensible-editor sensible-pager sensible-terminal sensible-utils-data)
pkgver=0.0.20
_debianextra='' # Do not remove even if empty as sometimes Debian puts e.g. +1, their version of a pkgrel.
pkgrel=6
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="http://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash' 'coreutils')
makedepends=('po4a'
             # for xargs
             'findutils')
checkdepends=('ed')
_dirname=${pkgbase}_${pkgver}_$pkgrel_${_debianextra}
source=("$_dirname.tar.xz::http://ftp.debian.org/debian/pool/main/s/$pkgbase/${pkgbase}_${pkgver}${_debianextra}.tar.xz"
        "$_dirname.dsc::http://ftp.debian.org/debian/pool/main/s/$pkgbase/${pkgbase}_${pkgver}${_debianextra}.dsc"
        0001-no-fork-bomb-test.patch
        sensible-utils.install
        sensible-envvars)
# (n)vim command to regenerate:
# :'<,'>! makepkg --geninteg 2>&1 | perl -pe '$_=~s/^[\s]*(==>|->).*//g; $_=~s/^[\s]*$//d'
b2sums=('e65419e7f157f64249b429806a4d48c02c5f492fb2dbdae1a8e4966dca964a4b1b9b6fdb555f03fabb6cd219238022821a64b15f11582ffdf115fa15ab6e3e0e'
        '8b122921916df3f4c138b99ac5183cae686e01be985db0ad2c77e3faff619779aecc596c6936c9f73f73ff3c73cf5ce30654df9158ce15caccd4ed0e0f50de09'
        '5d49350d8dafe08380eac326c9951fc24065ab0d867258112d28f4ca5c39170766600aa11c612c074ced4b5e35be59018aeb5a1d638a3dd51ade7d0f0f6d5bc0'
        'c39a760655833d374dc606894452c997bd86a1645c0b5496c5546364cac07ad4205c8dae05f457bd31a210bfd4d290fbcb71cdcf584df857e93c851b384bba81'
        '8a213b98cc6d432af30ecf58d91ae88f151f2824274702f7e1bde6119b45effc4a0b15907459c9f8f1ee5af94de862e6dec579b4f07d168aaa658443764a1f19')
# Bastien ROUCARIÈS <rouca@debian.org>
validpgpkeys=('5D0187B940A245BAD7B0F56A003A1A2DAA41085F')

prepare() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  rm test/fork-bomb
}

build() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  export -n EDITOR VISUAL PAGER TERMINAL_EMULATOR BROWSER
  ./configure --prefix=/usr
  patch Makefile ../0001-no-fork-bomb-test.patch
  make
}

# This trick is needed as the fork-bomb test only works if /bin/sh == /bin/dash,
# which it isn't on Arch but is on Debian!
check() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  env -i make check
}

_package_sensible() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  pkgdesc="$pkgdesc (${pkgname##*-})"
  export -n EDITOR VISUAL PAGER TERMINAL_EMULATOR BROWSER
  make DESTDIR="$pkgdir/" install
  shopt -s globstar
  cd "$pkgdir"
  find . -type f -and \( -not -iname "*$CURRENTLY_PACKAGING*" \) | xargs rm -v
}

package_sensible-pager() {
  depends+=(sensible-utils-data)
  CURRENTLY_PACKAGING=sensible-pager pkgdir="$pkgdir" _package_sensible
}

package_sensible-browser() {
  depends+=(sensible-utils-data)
  CURRENTLY_PACKAGING=sensible-browser pkgdir="$pkgdir" _package_sensible
}

package_sensible-editor() {
  depends+=(sensible-utils-data)
  CURRENTLY_PACKAGING=editor pkgdir="$pkgdir" _package_sensible
}

package_sensible-terminal() {
  depends+=(sensible-utils-data)
  CURRENTLY_PACKAGING=terminal pkgdir="$pkgdir" _package_sensible
}

package_sensible-utils-data() {
  depends=(bash)
  CURRENTLY_PACKAGING=gettext pkgdir="$pkgdir" _package_sensible
}

package_sensible-utils() {
  shopt -s extglob
  local rms
  rms='!(sensible-utils)'
  pkgdesc="$pkgdesc (metapackage)"
  depends+=(${_pkgname[@]})
  install=sensible-utils.install
  install -Dm0755 "$srcdir/sensible-envvars" "$pkgdir/usr/share/sensible-utils/sensible-envvars"
}

# vim:set syntax=bash ts=2 sw=2 et:
