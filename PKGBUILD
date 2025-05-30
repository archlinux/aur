# Maintainer: envolution
# Contributor:  Mateusz Ziemła <mtizim+aur@pm.me>
# Contributor: Jaroslv Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gdmap
pkgver=1.3.1+1
_debver=${pkgver/+/-}
_origver=${pkgver%%+*}
pkgrel=1
pkgdesc="Tool to inspect the used space of folders."
arch=('x86_64')
url='https://gitlab.com/sjohannes/gdmap'
license=('GPL-2.0-or-later')
depends=(libxml2 glibc cairo glib2 gdk-pixbuf2 gtk3)
makedepends=('meson' 'ninja' 'gettext')
source=(
  http://deb.debian.org/debian/pool/main/g/gdmap/gdmap_${_origver}.orig.tar.bz2
  http://deb.debian.org/debian/pool/main/g/gdmap/gdmap_${_debver}.debian.tar.xz
)
sha256sums=('3d71e829b88d4bb84f639ee65de8595d422ec55d8e65d0cb9d5a63a75218ac74'
            'cb519386880d601594d694a9796798816991118dbf1c307776e1be332e52e611')
prepare() {
  cd "${pkgname}-v${_origver}"
  if [[ -f "../debian/patches/series" ]]; then
    while read -r patch; do
      [[ -z $patch || $patch == \#* ]] && continue
      patch -Np1 <"../debian/patches/${patch}" || return 1
    done <"../debian/patches/series"
  else
    echo "Warning: patches/series file not found, skipping patching"
  fi
}
build() {
  cd "${pkgname}-v${_origver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${pkgname}-v${_origver}"
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 COPYING -t ${pkgdir}/usr/share/licenses/${pkgname}
}
# vim:set ts=2 sw=2 et:
