# Maintainer: Nichokas <https://github.com/Nichokas>
# Binary variant — downloads the prebuilt Linux tarball from GitHub Releases.
pkgname=grokbot-linux-port-bin
pkgver=0.24.0
pkgrel=2
pkgdesc="Grok Bot desktop — wine-less Linux port (prebuilt tarball from GitHub Releases)"
arch=('x86_64')
url="https://github.com/Nichokas/grokbot-linux-port"
license=('custom')
depends=(
  'alsa-lib' 'gtk3' 'nss' 'libxss' 'libxtst' 'libxrandr'
  'libxdamage' 'libxcomposite' 'libxfixes' 'libdrm' 'mesa'
  'libxkbcommon' 'at-spi2-core' 'cairo' 'pango'
  'expat' 'hicolor-icon-theme'
)
optdepends=('libnotify: desktop notifications')
provides=('grokbot-linux-port' 'grok-bot' 'grokbot')
conflicts=('grokbot-linux-port' 'grok-bot')
source=("Grok_Bot_${pkgver}_linux_x64.tar.gz::https://github.com/Nichokas/grokbot-linux-port/releases/download/v${pkgver}/Grok_Bot_${pkgver}_linux_x64.tar.gz")
sha256sums=('f6b6495f9398a9d60702a282b404ac52e2b1c1c345d3ba81bbbd242e49ea6aad')

package() {
  local staged
  staged="${srcdir}/Grok_Bot_${pkgver}_linux_x64"
  if [[ ! -d "${staged}" ]]; then
    echo "error: staged dir Grok_Bot_${pkgver}_linux_x64 not found under srcdir" >&2
    ls -R "${srcdir}" | head -n 100 >&2
    exit 1
  fi

  # Upstream tarball ships NSIS-derived restrictive modes (drwx------ on
  # app.asar.unpacked); cp -a would preserve them and pacman would then
  # install root-only directories. Normalise before copying.
  chmod -R u+rwX,go+rX,go-w "${staged}"

  # Refuse to package a tarball whose loadable native modules are still
  # Windows PE binaries — they dlopen-fail at runtime with "invalid ELF
  # header". Dead-on-Linux PE leftovers (win32 prebuild dirs, napi-rs
  # *.win32-*.node filenames) are tolerated: Linux loaders never resolve them.
  if [[ "${GROKBOT_ALLOW_BROKEN_NATIVE:-}" != "1" ]]; then
    local mz_live
    mz_live="$(find "${staged}" -name '*.node' -type f -exec sh -c \
      'head -c 2 "$1" | grep -q MZ && printf "%s\n" "$1"' _ {} \; 2>/dev/null \
      | grep -v -e '/prebuilds/win32-' -e '\.win32-[^/]*\.node$' || true)"
    if [[ -n "${mz_live}" ]]; then
      echo "error: loadable .node files in the tarball are win32 (MZ header) — upstream rebuild failed:" >&2
      printf '%s\n' "${mz_live}" | head -n 10 >&2
      echo "hint:  install grokbot-linux-port (builds from source) instead, or rebuild upstream via scripts/port.sh" >&2
      echo "hint:  GROKBOT_ALLOW_BROKEN_NATIVE=1 makepkg -si forces a known-broken install (debug only)" >&2
      exit 1
    fi
  fi

  install -dm755 "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin" \
                 "${pkgdir}/usr/share/applications" \
                 "${pkgdir}/usr/share/icons/hicolor/256x256/apps" \
                 "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -a "${staged}/." "${pkgdir}/opt/${pkgname}/"
  # Some tarballs keep electron as 'grok-bot' already; normalize
  if [[ ! -x "${pkgdir}/opt/${pkgname}/grok-bot" && -x "${pkgdir}/opt/${pkgname}/electron" ]]; then
    mv "${pkgdir}/opt/${pkgname}/electron" "${pkgdir}/opt/${pkgname}/grok-bot"
  fi
  chmod +x "${pkgdir}/opt/${pkgname}/grok-bot"

  ln -sf "/opt/${pkgname}/grok-bot" "${pkgdir}/usr/bin/grok-bot"
  ln -sf "/opt/${pkgname}/grok-bot" "${pkgdir}/usr/bin/grokbot"

  cat > "${pkgdir}/usr/share/applications/grok-bot.desktop" <<DESKTOP
[Desktop Entry]
Name=Grok Bot
GenericName=Grok Bot
Comment=Grok Bot desktop agent (Linux port)
Exec=/opt/${pkgname}/grok-bot %U
Icon=grok-bot
Type=Application
Categories=Utility;Development;
StartupWMClass=grok-bot
MimeType=x-scheme-handler/grokbot;
Terminal=false
DESKTOP

  local icon=""
  for cand in \
    "${staged}/resources/app.asar.unpacked/dist/renderer/assets/app-icon-"*.png \
    "${staged}/grok-bot.png" \
  ; do [[ -f "${cand}" ]] && { icon="${cand}"; break; } ; done
  if [[ -z "${icon}" ]]; then
    icon="$(find "${staged}" -name 'app-icon*.png' -print -quit 2>/dev/null || true)"
  fi
  if [[ -n "${icon}" && -f "${icon}" ]]; then
    install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/grok-bot.png"
  fi

  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<LICENSE
Grok Bot is proprietary software. This package fetches the prebuilt Linux
tarball published at https://github.com/Nichokas/grokbot-linux-port/releases.
See upstream terms at https://grok.com and inside resources/app.asar.
LICENSE

  if [[ -f "${pkgdir}/opt/${pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  fi
}
