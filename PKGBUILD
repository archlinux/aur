# Maintainer: Fahim Montasir Misbah <fahim@scirex.me>
# Maintainer: Ismet Togay <ismet.togay at gmail dot com>

pkgname=commandcode-bin
pkgver=0.1.40
pkgrel=1
pkgdesc="Desktop app for Command Code, an AI coding agent that learns your coding taste"
arch=('x86_64')
url="https://commandcode.ai/desktop"
license=('LicenseRef-command-code')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'mesa'
  'nss'
  'xdg-utils'
)
optdepends=('git: repository status and diffs')
options=('!strip')
install=commandcode-bin.install
# License = upstream ToS (https://commandcode.ai/terms); none shipped in source
source=("${pkgname}-${pkgver}.deb::https://github.com/CommandCodeAI/desktop/releases/download/v${pkgver}/CommandCode-${pkgver}-amd64.deb"
        "LICENSE-command-code")
sha256sums=('80e94699d79cd0e57640df9beba700165ec8f70dbc68ecdf2a4d9acc703fe62a'
            '0ecb7f651dd3c281515717e87240db1e417cd846cd521b4661512868d2f03768')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  # Disable the Electron updater
  sed -i 's|"updateFeed": "public"|"updateFeed": "none"|' \
    "${pkgdir}/opt/Command Code/resources/app/package.json"
  grep -q '"updateFeed": "none"' "${pkgdir}/opt/Command Code/resources/app/package.json"

  # Wrapper that disables the app's self-updater (updates come from pacman)
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/command-code-desktop" <<'EOF'
#!/bin/sh
# Self-update disabled; updates via pacman only
export CMD_DISABLE_AUTO_UPDATE=1
export COMMANDCODE_SKIP_UPDATES=1
exec "/opt/Command Code/command-code" "$@"
EOF

  # Point desktop entry at the wrapper (upstream Exec calls /opt directly)
  sed -i 's|^Exec="/opt/Command Code/command-code"|Exec=command-code-desktop|' \
    "${pkgdir}/usr/share/applications/command-code.desktop"
  grep -qx 'Exec=command-code-desktop %U' \
    "${pkgdir}/usr/share/applications/command-code.desktop"

  # Install only this package's license; bundled Electron/Chromium licenses stay in /opt
  install -Dm644 "${srcdir}/LICENSE-command-code" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Drop FPM's stub changelog (rm -rf won't fail if upstream removes it)
  rm -rf "${pkgdir}/usr/share/doc"
}
