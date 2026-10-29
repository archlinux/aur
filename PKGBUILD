# Maintainer: Sable Maintainers <https://git.sable.moe/SableClient/sable-next>

pkgname=sable-nightly-bin
# pkgver mirrors the release version with '-' replaced by '.', so each nightly
# sorts above the last. _relver keeps the original form for the asset URL.
pkgver=2.2.2.nightly.261029071351.g056e7ef4c11b
pkgrel=1
_relver=2.2.2-nightly.261029071351.g056e7ef4c11b
pkgdesc="A Matrix client (nightly builds)"
arch=('x86_64')
url="https://git.sable.moe/SableClient/sable-next"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
  'libnotify'
  'libxss'
  'libxtst'
  'at-spi2-core'
  'util-linux-libs'
  'xdg-utils'
  'hicolor-icon-theme'
  'desktop-file-utils'
)
provides=("sable-nightly=${pkgver}")
conflicts=('sable-nightly')
options=('!strip' '!debug')
noextract=("${pkgname}-${pkgver}-amd64.deb")
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::${url}/releases/download/nightly-${_relver}/sable-${_relver}-amd64.deb")
sha256sums_x86_64=('d2ebadcbf21f53e82ac15216dd696a1595b51c54729b7982a0a2c90e13855241')

package() {
  # bsdtar reads whichever compression the deb uses for data.tar.*
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}-amd64.deb" 'data.tar*' \
    | bsdtar -xp -C "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} +
  chmod 4755 "${pkgdir}/opt/Sable Nightly/chrome-sandbox"
  # Updates are managed by pacman, not electron-updater's Debian installer.
  rm -f "${pkgdir}/opt/Sable Nightly/resources/app-update.yml"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s '/opt/Sable Nightly/sable-nightly' "${pkgdir}/usr/bin/sable-nightly"
}
