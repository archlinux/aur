# Maintainer: Nichokas <https://github.com/Nichokas>
# Binary variant — downloads the prebuilt Linux tarball from GitHub Releases.
pkgname=grokbot-linux-port-bin
pkgver=0.20.0
pkgrel=1
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
sha256sums=('4e27644ca951d24efcda563e5aefa41a5f915ac451ae551d2e8283fac94d9630')

package() {
  local staged
  staged="${srcdir}/Grok_Bot_${pkgver}_linux_x64"
  if [[ ! -d "${staged}" ]]; then
    echo "error: staged dir Grok_Bot_${pkgver}_linux_x64 not found under srcdir" >&2
    ls -R "${srcdir}" | head -n 100 >&2
    exit 1
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
