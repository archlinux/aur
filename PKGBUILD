# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Patrice Peterson <runiq@archlinux.us>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=gog-transistor
# pkgver was once 2.0.0.3
epoch=2
pkgver='1.50440.8123.23365'
pkgrel=1
pkgdesc='A sci-fi themed action RPG that invites you to wield an extraordinary weapon. (GOG version)'
url='https://www.gog.com/game/transistor'
license=('custom')
groups=('games' 'gog')
arch=('i686' 'x86_64')
source=("local:///transistor_${pkgver//./_}.sh"
        "${pkgname}.desktop"
        "$pkgname")
sha256sums=('a02dc578764a59296431dcbb1fc3d1b9f57514bd40936a6bd909e38e8797823e'
            '091b5834175bd992eb3a9cafc20810223a63eca80dd8ca3491ac47c2bf2aaea1'
            'aa9ae97bd05a39aaac441323aeaa6b69abf849c2a5ce1e5ff751c2a380880a72')

# ABS automagically figures out how to extract this game file. If said magic
# starts failing in the future, see prepare() in gog-pyre.

prepare() {
  # Many files have permissions set to 0700.
  find "${srcdir}/data/noarch/game" -type f -print0 \
  | xargs -0 chmod 644
  find . -type f -name 'Transistor.bin.*' -print0 \
  | xargs -0 chmod 755
}

package(){
  # game files
  install -d "${pkgdir}/opt/${pkgname}"
  cp -rt "${pkgdir}/opt/${pkgname}" "${srcdir}/data/noarch/"*

  # launcher
  chmod 755 "${pkgdir}/opt/${pkgname}/start.sh"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # desktop environment integration
  install -Dm644 \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # license
  install -Dm644 \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
