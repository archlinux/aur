# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=opencode-desktop-v1-bin
pkgver=1.18.35
pkgrel=1
pkgdesc="OpenCode desktop client (1.x release line)"
arch=('x86_64' 'aarch64')
url="https://opencode.ai"
license=('MIT')
provides=('opencode-desktop')
conflicts=('opencode-desktop' 'opencode-desktop-bin')
# Upstream publishes the 1.x desktop only as GitHub release assets, while the
# opencode.ai mirror that backs opencode-desktop-bin carries the 2.x line alone.
# The two packages therefore track separate release channels and never merge.
_electron=electron42
depends=('ripgrep')
depends_x86_64=("${_electron}")
# Arch Linux ARM ships no electron package at all (which is also why official
# code is absent there), so only x86_64 can run on a system runtime. aarch64 keeps
# the bundled one and so has to carry its dependencies: of the 23 packages the
# bundled binary links against, gtk3, nss and alsa-lib are the only ones nothing
# else pulls, and libpulse is dlopen'd rather than linked — invisible to that
# reading, but it is what Chromium plays audio through.
depends_aarch64=('gtk3' 'nss' 'libxss' 'libxtst' 'alsa-lib' 'libsecret' 'libnotify' 'xdg-utils'
                 'libpulse')
optdepends=('libappindicator-gtk3: tray icon support')
# Prebuilt payload: never publish -debug split packages for binaries we did not
# compile. Strip stays at the builder default — unlike opencode-desktop-bin there
# is no bundled CLI whose embedded bundle a strip would discard (the server runs
# in-process here, and the v2 sidecar path that wants a CLI is opt-in through
# OPENCODE_SIDECAR_V2=1), and the only ELF files left to strip are the native
# addons, whose export tables strip --strip-unneeded leaves byte-identical.
options=('!debug')

latestver() {
  # The 1.x line keeps its own release stream, so the newest v1.* release is the
  # version source even once 2.x starts publishing releases of its own.
  curl -fsSL 'https://api.github.com/repos/anomalyco/opencode/releases?per_page=100' |
    jq -r 'first(.[] | .tag_name | select(startswith("v1."))) | ltrimstr("v")'
}

source=("LICENSE::https://raw.githubusercontent.com/anomalyco/opencode/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-linux-amd64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-linux-arm64.deb::https://github.com/anomalyco/opencode/releases/download/v${pkgver}/opencode-desktop-linux-arm64.deb")
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_x86_64=('2243bff81e3ac08605fe8a2aff022f3f581cfd2ef07136a3f7cc32cb9fc74fa6')
sha256sums_aarch64=('6c3f87e48b9dc53042aa9e850c055ec92a2ec893b3295673a93bf265ed7e5f75')

package() {
  local _debarch=amd64
  [[ "${CARCH}" == aarch64 ]] && _debarch=arm64
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-linux-${_debarch}.deb" data.tar.xz
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

    # Keep the app payload only; the bundled Chromium/Node runtime is replaced by
    # the system electron, which ships its own sandbox, codecs and ICU data. The
    # payload is laid out flat because electron resolves the asar path itself but
    # not a directory holding nothing but app.asar.
    _appdir="${pkgdir}/usr/lib/opencode-desktop-v1"
    install -d "${_appdir}"
    mv "${pkgdir}/opt/OpenCode/resources/app.asar" \
      "${pkgdir}/opt/OpenCode/resources/app.asar.unpacked" "${_appdir}/"
    rm -rf "${pkgdir}/opt"
    _exec="${_electron} /usr/lib/opencode-desktop-v1/app.asar"
  else
    _appdir="${pkgdir}/opt/OpenCode/resources"
    _exec="/opt/OpenCode/ai.opencode.desktop"
  fi

  # A distro package must never self-update, and the shipped apparmor profile only
  # applies to Ubuntu's AppArmor setup.
  rm -f "${_appdir}/app-update.yml" "${_appdir}/apparmor-profile"
  rm -rf "${pkgdir}/usr/share/doc"

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

  # Upstream's entries launch the bundled build; point both at the wrapper instead
  sed -i 's|Exec=/opt/OpenCode/ai\.opencode\.desktop|Exec=opencode-desktop|' \
    "${pkgdir}"/usr/share/applications/*.desktop

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}