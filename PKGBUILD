# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.18.5
pkgrel=1
pkgdesc="OpenCode desktop client"
arch=('x86_64' 'aarch64')
url="https://opencode.ai"
license=('MIT')
provides=('opencode-desktop')
conflicts=('opencode-desktop')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'alsa-lib' 'libsecret' 'libnotify' 'xdg-utils' 'ripgrep')
optdepends=('libappindicator-gtk3: tray icon support')
options=('!debug')

latestver() {
  gh api --paginate repos/anomalyco/opencode/releases --jq \
    '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "opencode-desktop-linux-amd64.deb") and any(.assets[]; .name == "opencode-desktop-linux-arm64.deb")) | .tag_name' |
    head -1 | sed -E 's/^v//'
}

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE")
source_x86_64=("opencode-desktop-${pkgver}-linux-amd64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-amd64.deb")
source_aarch64=("opencode-desktop-${pkgver}-linux-arm64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-arm64.deb")
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_x86_64=('7f73375186c561bc4f4692a8213a7d2b018700b1efc3fbcc647acfe880a601af')
sha256sums_aarch64=('d975034d6dc61651635fe3f96200527168471f90770268d3a3a288b8fb1f2703')

package() {
  local _debarch=amd64
  [[ "${CARCH}" == aarch64 ]] && _debarch=arm64
  bsdtar -xf "${srcdir}/opencode-desktop-${pkgver}-linux-${_debarch}.deb" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Prune Debian/Ubuntu-specific and dead files
  rm -rf "${pkgdir}/usr/share/doc"
  rm -f "${pkgdir}/opt/OpenCode/resources/apparmor-profile"
  rm -f "${pkgdir}/opt/OpenCode/resources/app-update.yml"

  # Prune musl native modules (useless on glibc Arch)
  find "${pkgdir}/opt/OpenCode" -name '*.musl.node' -delete
  find "${pkgdir}/opt/OpenCode" -depth -type d -name '*-musl' -exec rm -rf {} +

  # Launcher script (supports user flags and Wayland)
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/opencode-desktop" <<'EOF'
#!/bin/bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ -f "$XDG_CONFIG_HOME/opencode-desktop-flags.conf" ]]; then
  OPENCODE_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/opencode-desktop-flags.conf")"
fi
exec /opt/OpenCode/ai.opencode.desktop $OPENCODE_USER_FLAGS "$@"
EOF

  # Point desktop files at the wrapper (icons/StartupWMClass already match upstream names)
  sed -i 's|Exec=/opt/OpenCode/ai\.opencode\.desktop|Exec=opencode-desktop|' \
    "${pkgdir}"/usr/share/applications/*.desktop

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
