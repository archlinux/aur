#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: éclairevoyant
# Contributor: Brian BIdulock <bidulock@openss7.org>

pkgbase=sensible-utils
pkgname=(sensible-utils sensible-browser sensible-editor sensible-pager sensible-terminal sensible-utils-data)
# This is the above minus the pkgbase name, for use in sensible-utils packaging command.
_pkgname=(sensible-browser sensible-editor sensible-pager sensible-terminal sensible-utils-data)
pkgver=0.0.21
_debianextra='' # Do not remove even if empty as sometimes Debian puts e.g. +1, their version of a pkgrel.
pkgrel=1
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
        sensible-utils.install
        sensible-envvars)
# (n)vim command to regenerate:
# :'<,'>! makepkg --geninteg 2>&1 | perl -pe '$_=~s/^[\s]*(==>|->).*//g; $_=~s/^[\s]*$//d'
b2sums=('3540965529583afe60f7abb9eade22c9f06f7d5dc4d266bfad35c0a33337db341fff2f3e59e25e1c53fb845c9f4e4d1587f0215000fdd3ba9f499ed35d9f7ef9'
        'da806a63d4fe66f341564d8edaaa7669acf181c57595baf0be9eb33d1c2a0554aa0faa18e0449840d8b5941b592359e937cc0ba79a96a1fa276828a9b05c1181'
        'c39a760655833d374dc606894452c997bd86a1645c0b5496c5546364cac07ad4205c8dae05f457bd31a210bfd4d290fbcb71cdcf584df857e93c851b384bba81'
        '8a213b98cc6d432af30ecf58d91ae88f151f2824274702f7e1bde6119b45effc4a0b15907459c9f8f1ee5af94de862e6dec579b4f07d168aaa658443764a1f19')
# Bastien ROUCARIÈS <rouca@debian.org>
validpgpkeys=('5D0187B940A245BAD7B0F56A003A1A2DAA41085F')

build() {
  cd ${pkgbase}
  export -n EDITOR VISUAL PAGER TERMINAL_EMULATOR BROWSER
  ./configure --prefix=/usr
  find .. -type f -and -name '*.patch' -print0 | xargs -0r patch -p1
  make
}

# This trick is needed as the fork-bomb test only works if /bin/sh == /bin/dash,
# which it isn't on Arch but is on Debian!
check() {
  cd ${pkgbase}
  env -i make check
}

_package_sensible() {
  cd ${pkgbase}
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
