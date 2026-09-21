# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-bin
pkgver=2.0.12
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
makedepends_x86_64=('asar')
optdepends=('libappindicator-gtk3: tray icon support')
# opencode-cli is a Bun standalone executable: stripping discards the embedded
# bundle and leaves a bare Bun runtime that no longer knows the "serve" command.
options=('!strip' '!debug')

latestver() {
  curl -fsSL https://opencode.ai/update/api/latest/desktop/opencode | jq -r '.version'
}

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE")
source_x86_64=("opencode-desktop-${pkgver}-linux-amd64.deb::https://opencode.ai/files/bin/${pkgver}/opencode-desktop-linux-amd64.deb")
source_aarch64=("opencode-desktop-${pkgver}-linux-arm64.deb::https://opencode.ai/files/bin/${pkgver}/opencode-desktop-linux-arm64.deb")
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_x86_64=('f090e3846d1009bb25afb36b64d8aa98593880b13c332b625ce74e74ecc403c3')
sha256sums_aarch64=('6c969739c05f1ea0985d709b78dcca2932146805b88b3c85fad7e185bb9a04a2')

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

    # The app resolves opencode-cli relative to process.resourcesPath, which the
    # system electron reports as its own directory. A shim app repoints it here
    # and then loads the untouched asar.
    asar extract-file "${_appdir}/app.asar" package.json
    sed -i 's|"main": "./out/main/index.js"|"main": "./main.mjs"|' package.json
    grep -q '"main": "./main.mjs"' package.json
    install -Dm644 package.json "${_appdir}/package.json"
    install -Dm644 /dev/stdin "${_appdir}/main.mjs" <<'EOF'
Object.defineProperty(process, "resourcesPath", { value: import.meta.dirname, configurable: true })
await import("./app.asar/out/main/index.js")
EOF
    _exec="${_electron} /usr/lib/opencode-desktop"
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
