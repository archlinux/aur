# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=caps-lv2
pkgname="${_pkgname}-git"
pkgver=0.9.24.r153.072e2fe
pkgrel=1
pkgdesc="The LADSPA C* Audio Plugin Suite (LV2 port)"
arch=('i686' 'x86_64')
url="http://quitte.de/dsp/caps.html"
license=('GPL3')
depends=('lv2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=('lv2-plugins')
makedepends=('python')
source=("${_pkgname}::git+https://github.com/moddevices/caps-lv2.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  cat > version.c <<__EOF__
#include "version.h"
#include <stdio.h>
void main() {
  printf("%d.%d.%d\n", CAPS_version[0], CAPS_version[1], CAPS_version[2]);
}
__EOF__
  gcc -o version version.c
  echo $(./version).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Replace deprecated 'pow10f' function
  sed -i -e 's/pow10f/exp10f/g' dsp/v4f_IIR2.h
}

build() {
  cd "${srcdir}/${_pkgname}"

  python configure.py
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"

  unset LV2_PATH
  make PREFIX=/usr DESTDIR="$pkgdir" install
  #rm -rf "$pkgdir"/usr/lib/lv2/mod-caps-*.lv2/modgui*
}

# vim:set ts=2 sw=2 et:
