# Maintainer: envolution
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname="doom_ascii"
pkgver=0.3.1
pkgrel=1
pkgdesc="Text-based DOOM in your terminal! Source-port of doomgeneric. Does not have sound."
arch=(x86_64 i686)
url="https://github.com/wojciech-graj/doom-ascii"
license=('GPL-2.0-or-later')
depends=('glibc' 'sh')
install=doom_ascii.install
_pkgsrc="doom-ascii-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.sh"
  cstd23.patch)
sha256sums=('7ade3d78d9403542cf53b3ed3a1575751c815d4b7ff3f1fb364aa1ee664807f0'
            '7e4817fcb8bcd5038f648e0f8291ca073a3f111fba6e133984b906cc26dfafc1'
            '674a1b2b4a07c11d49bd917c461c983a34b1d7867835a9d3bafc20ee577dfb50')
backup=("usr/lib/${pkgname}/.default.cfg")

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np2 -i ../cstd23.patch
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  cd "${_pkgsrc}"
  install -Dm755 "_unix/game/doom-ascii" "${pkgdir}/usr/share/bin/${pkgname}.bin"
  install -Dm666 "_unix/game/.default.cfg" "${pkgdir}/usr/lib/${pkgname}/.default.cfg"
  ln -s .default.cfg "${pkgdir}/usr/lib/${pkgname}/default.cfg"
  install -dm777 "${pkgdir}/usr/lib/${pkgname}/.savegame"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
