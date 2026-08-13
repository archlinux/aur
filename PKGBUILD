# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=1.18.18
pkgrel=1
pkgdesc="OpenCode desktop client"
arch=('x86_64' 'aarch64')
url="https://opencode.ai"
license=('MIT')
provides=('opencode-desktop')
conflicts=('opencode-desktop')
# Arch Linux ARM ships no electron package at all (which is also why official
# code is absent there), so only x86_64 can run on a system runtime.
_electron=electron42
depends=('ripgrep')
depends_x86_64=("${_electron}")
depends_aarch64=('gtk3' 'nss' 'libxss' 'libxtst' 'alsa-lib' 'libsecret' 'libnotify' 'xdg-utils')
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
sha256sums_x86_64=('7b7d646b9c7cd97f0df098a94c47084f1e166f0dfc452b7287045952e112d48a')
sha256sums_aarch64=('eea3f6a5bf817d33f1d3061589a9553fa33709bf125aacfe4fe677f31f1fe853')

package() {
  local _debarch=amd64
  [[ "${CARCH}" == aarch64 ]] && _debarch=arm64
  bsdtar -xf "${srcdir}/opencode-desktop-${pkgver}-linux-${_debarch}.deb" data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  local _appdir _exec
  if [[ "${CARCH}" == x86_64 ]]; then
    # The app only has to work on the Electron it was built against, so refuse
    # to package a runtime pairing upstream never shipped.
    local _bundled
    _bundled=$(grep -aoP 'Electron/\K[0-9]+' "${pkgdir}/opt/OpenCode/ai.opencode.desktop" | head -1)
    if [[ "electron${_bundled}" != "${_electron}" ]]; then
      echo "Upstream now bundles Electron ${_bundled:-<undetected>}; set _electron=electron${_bundled}" >&2
      exit 1
    fi

    # Keep the app payload only; the bundled Chromium/Node runtime is replaced
    # by the system electron, which ships its own sandbox, codecs and ICU data.
    _appdir="${pkgdir}/usr/lib/opencode-desktop"
    install -d "${_appdir}"
    mv "${pkgdir}/opt/OpenCode/resources/"* "${_appdir}/"
    rm -rf "${pkgdir}/opt"
    _exec="${_electron} /usr/lib/opencode-desktop/app.asar"
  else
    _appdir="${pkgdir}/opt/OpenCode/resources"
    _exec="/opt/OpenCode/ai.opencode.desktop"
  fi

  # Prune Debian/Ubuntu-specific and dead files
  rm -rf "${pkgdir}/usr/share/doc"
  rm -f "${_appdir}/apparmor-profile"
  rm -f "${_appdir}/app-update.yml"

  # Prune musl native modules (useless on glibc Arch)
  find "${_appdir}" -name '*.musl.node' -delete
  find "${_appdir}" -depth -type d -name '*-musl' -exec rm -rf {} +

  # Launcher script (supports user flags and Wayland)
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/opencode-desktop" <<'EOF'
#!/bin/bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ -f "$XDG_CONFIG_HOME/opencode-desktop-flags.conf" ]]; then
  OPENCODE_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/opencode-desktop-flags.conf")"
fi
exec @EXEC@ $OPENCODE_USER_FLAGS "$@"
EOF
  sed -i "s|@EXEC@|${_exec}|" "${pkgdir}/usr/bin/opencode-desktop"

  # Point desktop files at the wrapper (icons/StartupWMClass already match upstream names)
  sed -i 's|Exec=/opt/OpenCode/ai\.opencode\.desktop|Exec=opencode-desktop|' \
    "${pkgdir}"/usr/share/applications/*.desktop

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
