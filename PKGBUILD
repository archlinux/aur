# Maintainer: Sable Maintainers <https://git.sable.moe/SableClient/sable-next>

pkgname=sable-nightly-bin
# pkgver mirrors the release version with '-' replaced by '.', so each nightly
# sorts above the last. _relver keeps the original form for the asset URL.
pkgver=26.11.6.nightly.28.845.ge1e3c7
pkgrel=1
_relver=26.11.6-nightly.28.845.ge1e3c7
pkgdesc="A Matrix client (nightly builds)"
arch=('x86_64')
url="https://git.sable.moe/SableClient/sable-next"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
  'libnotify'
  'libpulse'
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
sha256sums_x86_64=('b13b32d32f0ddbdd604a20e42e3db16995d7ed74da513cfcd6c291b254b0666f')

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
