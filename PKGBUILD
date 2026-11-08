# Maintainer: czyt <czytcn@gmail.com>

pkgname=doop-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Open-source multiplayer design canvas where humans and AI agents design together (desktop shell)"
arch=('x86_64')
url="https://github.com/kgoedecke/doop"
license=('AGPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('doop')
conflicts=('doop')
options=('!strip' '!debug')

_deb="doop_${pkgver}_amd64.deb"
source_x86_64=(
  "${_deb}::${url}/releases/download/desktop-v${pkgver}/${_deb}"
  "LICENSE::${url}/raw/desktop-v${pkgver}/LICENSE"
)
sha256sums_x86_64=('3e2eb4429e5740fc5095f671e8976fa4d6d338c19105f5a3e8143b0c01419cc8'
                   '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
noextract=("${_deb}")

package() {
  local data_archive
  data_archive=$(bsdtar -tf "${srcdir}/${_deb}" | awk '/^data\.tar(\.|$)/ { print; exit }')
  [[ -n "$data_archive" ]] || return 1
  bsdtar -xOf "${srcdir}/${_deb}" "$data_archive" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}" || return 1

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod -R u=rwX,go=rX "${pkgdir}"
}
