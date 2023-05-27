#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Brian BIdulock <bidulock@openss7.org>
pkgbase=sensible-utils
pkgname=(sensible-pager sensible-editor sensible-browser sensible-utils-data)
pkgver=0.0.19
_debianextra=''
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
arch=('any')
url="http://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash' 'coreutils')
provides=(sensible-pager sensible-editor sensible-browser)
conflicts=(sensible-pager sensible-editor sensible-browser)
makedepends=('po4a')
checkdepends=('ed')
source=("http://ftp.debian.org/debian/pool/main/s/$pkgbase/${pkgbase}_${pkgver}${_debianextra}.tar.xz"
        "http://ftp.debian.org/debian/pool/main/s/$pkgbase/${pkgbase}_${pkgver}${_debianextra}.dsc"
        "0001-no-fork-bomb-test.patch"
        "sensible-utils_0.0.19.dsc.sig"
        "sensible-utils_0.0.19.tar.xz.sig")
sha256sums=('3af5fe874c9e643b3d413d4f1b71009194c9093225e9dd49de86e2e604721d69'
            '758218a18c89964da1b2bcfb1e457949ef4e9ccc18a5b9061bb547b617167e1b'
            '063c12d9dfb193f94ded0de3384a78a463c72d0fb1eb3b8edbafe418efaebc46'
            'SKIP'
            'SKIP')
validpgpkeys=('98F28F767470129FBE3B054CE2154DD1A1C77B8B')

prepare() {
  pushd ${pkgbase}-${pkgver}${_debianextra}
  OPWD="$PWD"
  popd
  patch -p0 "$OPWD/Makefile.am" < 0001-no-fork-bomb-test.patch
}

build() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  export -n EDITOR VISUAL
  ./configure --prefix=/usr
  make
}

build_sensible-utils() {
  exit 0
}

check() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  bash -c 'make -k check'
}

_package_sensible() {
  cd ${pkgbase}-${pkgver}${_debianextra}
  pkgdesc="$pkgdesc (${pkgname##*-})"
  provides=()
  conflicts=()
  depends+=(sensible-utils-data)
  [ "$pkgname" != sensible-utils-data ] && provides=($pkgname)
  [ "$pkgname" != sensible-utils-data ] && conflicts=($pkgname)
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

package_sensible-utils-data() {
  CURRENTLY_PACKAGING=gettext pkgdir="$pkgdir" _package_sensible
}

package_sensible-utils() {
  pkgdesc="$pkgdesc (metapackage)"
  provides=()
  conflicts=()
  depends+=(sensible-pager sensible-editor sensible-browser sensible-utils-data)
  mkdir -p "$pkgdir/usr/share/sensible-utils"
  echo 1 > "$pkgdir/usr/share/sensible-utils/.ARCH"
}

# vim:set ts=2 sw=2 et:
