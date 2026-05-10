# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.14.46
pkgrel=1
pkgdesc="OpenCode desktop client"
arch=('x86_64')
url="https://opencode.ai"
license=('MIT')
provides=('opencode-desktop')
conflicts=('opencode-desktop')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'alsa-lib' 'libsecret' 'libnotify' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon support')
options=('!debug')

latestver() {
  gh api --paginate repos/anomalyco/opencode/releases --jq \
    '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "opencode-desktop-linux-amd64.deb")) | .tag_name' |
    head -1 | sed -E 's/^v//'
}

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE")
source_x86_64=("opencode-desktop-${pkgver}-linux-amd64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-amd64.deb")
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_x86_64=('dc5a9a6f4562f1ffd32fd5009acb2d8942f6ccbea88b4cbe372436a46d3ff375')

package() {
  bsdtar -xf "${srcdir}/opencode-desktop-${pkgver}-linux-amd64.deb" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Prune Debian/Ubuntu-specific and dead files
  rm -rf "${pkgdir}/usr/share/doc"
  rm -f "${pkgdir}/opt/OpenCode/resources/apparmor-profile"
  rm -f "${pkgdir}/opt/OpenCode/resources/app-update.yml"

  # Prune musl native modules (useless on glibc Arch)
  find "${pkgdir}/opt/OpenCode" -name '*.musl.node' -delete

  # Launcher script (supports user flags and Wayland)
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/opencode-desktop" <<'EOF'
#!/bin/bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ -f "$XDG_CONFIG_HOME/opencode-desktop-flags.conf" ]]; then
  OPENCODE_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/opencode-desktop-flags.conf")"
fi
exec /opt/OpenCode/@opencode-aidesktop $OPENCODE_USER_FLAGS "$@"
EOF

  # Desktop file: fix Exec/Icon, rename to a sane filename
  local desktop="${pkgdir}/usr/share/applications/@opencode-aidesktop.desktop"
  sed -i \
    -e 's|Exec="/opt/OpenCode/@opencode-aidesktop"|Exec=opencode-desktop|' \
    -e 's|Icon=@opencode-aidesktop|Icon=opencode-desktop|' \
    "$desktop"
  mv "$desktop" "${pkgdir}/usr/share/applications/opencode-desktop.desktop"

  # Rename icons to match Icon= field
  for dir in "${pkgdir}"/usr/share/icons/hicolor/*/apps; do
    [ -f "${dir}/@opencode-aidesktop.png" ] || continue
    mv "${dir}/@opencode-aidesktop.png" "${dir}/opencode-desktop.png"
  done

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
