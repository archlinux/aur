#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: éclairevoyant
# Contributor: Brian BIdulock <bidulock@openss7.org>

pkgbase=sensible-utils-git
pkgname=(sensible-utils-git sensible-browser-git sensible-editor-git sensible-pager-git sensible-terminal-git sensible-utils-data-git)
# This is the above minus the pkgbase name, for use in sensible-utils packaging function.
_pkgname=(sensible-browser-git sensible-editor-git sensible-pager-git sensible-terminal-git sensible-utils-data-git)
pkgver=0.0.21.r3.b555a8d
_debianextra='' # Do not remove even if empty as sometimes Debian puts e.g. +1, their version of a pkgrel.
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="https://salsa.debian.org/debian/sensible-utils"
license=('GPL')
depends=('bash' 'coreutils')
makedepends=('po4a'
             # for xargs
             'findutils')
checkdepends=('ed'
              # see comment in check() function
              'dash')
_dirname=${pkgbase}_${pkgver}_$pkgrel_${_debianextra}
source=("$pkgbase::git+https://salsa.debian.org/debian/sensible-utils.git"
        sensible-utils.install
        sensible-envvars)
# (n)vim command to regenerate:
# :'<,'>! makepkg --geninteg 2>&1 | perl -pe '$_=~s/^[\s]*(==>|->).*//g; $_=~s/^[\s]*$//d'
b2sums=('SKIP'
        'c39a760655833d374dc606894452c997bd86a1645c0b5496c5546364cac07ad4205c8dae05f457bd31a210bfd4d290fbcb71cdcf584df857e93c851b384bba81'
        '8a213b98cc6d432af30ecf58d91ae88f151f2824274702f7e1bde6119b45effc4a0b15907459c9f8f1ee5af94de862e6dec579b4f07d168aaa658443764a1f19')
# Bastien ROUCARIÈS <rouca@debian.org>
validpgpkeys=('5D0187B940A245BAD7B0F56A003A1A2DAA41085F')

pkgver() {
  cd "$srcdir/$pkgbase"
  printf "%s" "$(git describe --long | sed 's@debian/@@;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd ${pkgbase}
  export -n EDITOR VISUAL PAGER TERMINAL_EMULATOR BROWSER
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgbase}
  make check
}

_package_sensible() {
  cd ${pkgbase}
  pkgdesc="$pkgdesc (${pkgname##*-})"
  provides=(${pkgname%%-git})
  conflicts=(${pkgname%%-git})
  export -n EDITOR VISUAL PAGER TERMINAL_EMULATOR BROWSER
  env -i make DESTDIR="$pkgdir/" install
  shopt -s globstar
  cd "$pkgdir"
  find . -type f -and \( -not -iname "*$CURRENTLY_PACKAGING*" \) | xargs rm -v
}

package_sensible-pager-git() {
  depends+=(sensible-utils-data)
  CURRENTLY_PACKAGING=sensible-pager pkgdir="$pkgdir" _package_sensible
}

package_sensible-browser-git() {
  depends+=(sensible-utils-data)
  CURRENTLY_PACKAGING=sensible-browser pkgdir="$pkgdir" _package_sensible
}

package_sensible-editor-git() {
  depends+=(sensible-utils-data)
  optdepends=('update-alternatives: For using the `select-editor` script')
  CURRENTLY_PACKAGING=editor pkgdir="$pkgdir" _package_sensible
}

package_sensible-terminal-git() {
  depends+=(sensible-utils-data)
  CURRENTLY_PACKAGING=terminal pkgdir="$pkgdir" _package_sensible
}

package_sensible-utils-data-git() {
  depends=(bash)
  CURRENTLY_PACKAGING=gettext pkgdir="$pkgdir" _package_sensible
}

package_sensible-utils-git() {
  shopt -s extglob
  local rms
  rms='!(sensible-utils)'
  pkgdesc="$pkgdesc (metapackage)"
  depends+=(${_pkgname[@]})
  provides=(${pkgname%%-git})
  conflicts=(${pkgname%%-git})
  install=sensible-utils.install
  install -Dm0755 "$srcdir/sensible-envvars" "$pkgdir/usr/share/sensible-utils/sensible-envvars"
}

# vim:set syntax=bash ts=2 sw=2 et:
