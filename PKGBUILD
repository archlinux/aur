# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=caps-lv2
pkgname="${_pkgname}-git"
pkgver=0.9.23.r99.76cce8e
pkgrel=1
pkgdesc="The LADSPA C* Audio Plugin Suite (LV2 port)"
arch=('i686' 'x86_64')
url="http://quitte.de/dsp/caps.html"
license=('GPL3')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=('lv2-plugins')
makedepends=('lv2')
source=("${_pkgname}::git+https://github.com/moddevices/caps-lv2.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  cat > version.c << __EOF__
#include "version.h"
#include <stdio.h>
void main() {
    printf("%d.%d.%d", CAPS_version[0], CAPS_version[1], CAPS_version[2]);
}
__EOF__
  gcc version.c
  version="$(./a.out)"
  echo ${version}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  cd "${srcdir}/${_pkgname}"

  make $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  unset LV2_PATH
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/lib/lv2/caps.lv2/modgui"
}

# vim:set ts=2 sw=2 et:
