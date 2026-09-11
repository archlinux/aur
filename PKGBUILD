# Maintainer: wzl <git@wzl.cc>

pkgname=nvpair-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='NVIDIA Personal AI Router for local inference (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/NVIDIA/Personal-AI-Router'
license=('Apache-2.0')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'cups' 'dbus' 'expat' 'gcc-libs'
  'glib2' 'glibc' 'gtk3' 'libnotify' 'libsecret' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango'
  'systemd-libs' 'util-linux-libs' 'xdg-utils'
)
optdepends=(
  'libappindicator: system tray integration'
  'ollama: local inference backend'
)
provides=("nvpair=${pkgver}")
conflicts=('nvpair')
options=('!strip')

source_x86_64=(
  "${pkgname}-${pkgver}-x86_64.deb::https://github.com/NVIDIA/Personal-AI-Router/releases/download/v${pkgver}/NVPAIR-Setup-${pkgver}-amd64.deb"
)
source_aarch64=(
  "${pkgname}-${pkgver}-aarch64.deb::https://github.com/NVIDIA/Personal-AI-Router/releases/download/v${pkgver}/NVPAIR-Setup-${pkgver}-arm64.deb"
)
sha256sums_x86_64=('879fc316b5bff9f26f05f02b40cacfff8f14c5c79a751bdd975d568b40b543ac')
sha256sums_aarch64=('9f64b21c99fbd2517e3ef3ab9feec7f5aa0bcf4c338fa55846f0564148442229')
noextract=(
  "${pkgname}-${pkgver}-x86_64.deb"
  "${pkgname}-${pkgver}-aarch64.deb"
)

package() {
  local deb="${srcdir}/${pkgname}-${pkgver}-${CARCH}.deb"

  # The upstream package currently contains data.tar.xz.
  bsdtar -xOf "$deb" data.tar.xz | \
    bsdtar --no-same-owner -xpf - -C "$pkgdir"

  # Upstream duplicates Name as Comment, which desktop-file-validate warns about.
  sed -i 's/^Comment=.*/Comment=Route local AI inference across compatible computers/' \
    "${pkgdir}/usr/share/applications/nvpair.desktop"

  # The Debian postinst creates this TUI launcher. Put it under pacman's
  # ownership instead of creating an unmanaged file during installation.
  install -d "${pkgdir}/usr/bin"
  printf '%s\n' \
    '#!/bin/sh' \
    'exec /opt/PAIR/resources/cli-bin/nvpair-tui "$@"' \
    > "${pkgdir}/usr/bin/nvpair"
  chmod 0755 "${pkgdir}/usr/bin/nvpair"

  # Required by Electron when the setuid sandbox is used.
  chmod 4755 "${pkgdir}/opt/PAIR/chrome-sandbox"

  # electron-builder emitted a few mode 0666 data files.
  chmod -R go-w "$pkgdir"
  chmod 4755 "${pkgdir}/opt/PAIR/chrome-sandbox"

  install -Dm644 "${pkgdir}/opt/PAIR/resources/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/opt/PAIR/resources/THIRD_PARTY_NOTICES.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
