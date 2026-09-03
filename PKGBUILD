# Maintainer: Nichokas <https://github.com/Nichokas>
# Binary variant — downloads the prebuilt Linux tarball from GitHub Releases,
# itself repacked verbatim from xAI's official Linux .deb.
pkgname=grokbot-linux-port-bin
pkgver=0.36.0
pkgrel=4
pkgdesc="Grok Bot desktop agent (repacked from the official Linux .deb)"
arch=('x86_64' 'aarch64')
url="https://github.com/Nichokas/grokbot-linux-port"
license=('custom')
depends=(
  'alsa-lib' 'gtk3' 'nss' 'libxss' 'libxtst' 'libxrandr'
  'libxdamage' 'libxcomposite' 'libxfixes' 'libdrm' 'mesa'
  'libxkbcommon' 'at-spi2-core' 'cairo' 'pango'
  'expat' 'libsecret' 'hicolor-icon-theme'
)
optdepends=('libnotify: desktop notifications')
provides=('grok-bot' 'grokbot')
conflicts=('grok-bot')
source_x86_64=("Grok_Bot_${pkgver}_linux_x64.tar.gz::https://github.com/Nichokas/grokbot-linux-port/releases/download/v${pkgver}/Grok_Bot_${pkgver}_linux_x64.tar.gz")
source_aarch64=("Grok_Bot_${pkgver}_linux_arm64.tar.gz::https://github.com/Nichokas/grokbot-linux-port/releases/download/v${pkgver}/Grok_Bot_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8085c220956606639dd6b52e89f134418dd0d94d65c40f2a1663460a401d78a0')
sha256sums_aarch64=('27dce806e818ec74c3f0c874dd1c26dbe8ba14677a8d11dffd6f00121695dbd8')

package() {
  # Per-arch source arrays land the matching tarball under ${srcdir}; pick
  # the staged dir for THIS CARCH. A leftover sibling-arch dir (a previous
  # makepkg run in the same srcdir) must never win over the current build.
  local arch_dir
  case "${CARCH}" in
    x86_64)  arch_dir="linux_x64" ;;
    aarch64) arch_dir="linux_arm64" ;;
    *) echo "error: unsupported CARCH '${CARCH}'" >&2; exit 1 ;;
  esac
  local staged="${srcdir}/Grok_Bot_${pkgver}_${arch_dir}"
  if [[ ! -d "${staged}" ]]; then
    echo "error: no staged Grok_Bot_${pkgver}_${arch_dir} dir found under srcdir" >&2
    ls -R "${srcdir}" | head -n 100 >&2
    exit 1
  fi

  install -dm755 "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin" \
                 "${pkgdir}/usr/share/applications"

  # The tarball is repacked verbatim from xAI's official Linux .deb, so its
  # modes are already sane and its native modules are Linux ELF — the
  # normalisation pass and MZ-header guard the porting pipeline needed are
  # gone. hicolor/ rides along for the icon install below.
  cp -a "${staged}/payload/." "${pkgdir}/opt/${pkgname}/"
  chmod +x "${pkgdir}/opt/${pkgname}/grok-bot"

  ln -sf "/opt/${pkgname}/grok-bot" "${pkgdir}/usr/bin/grok-bot"
  ln -sf "/opt/${pkgname}/grok-bot" "${pkgdir}/usr/bin/grokbot"

  cat > "${pkgdir}/usr/share/applications/grok-bot.desktop" <<DESKTOP
[Desktop Entry]
Name=Grok Bot
GenericName=Grok Bot
Comment=Grok Bot desktop agent
Exec=/opt/${pkgname}/grok-bot %U
Icon=grok-bot
Type=Application
Categories=Utility;Development;
StartupWMClass=grok-bot
MimeType=x-scheme-handler/grokbot;x-scheme-handler/sand;
Terminal=false
DESKTOP

  # Full hicolor tree (16..512) repacked from the .deb's /usr/share/icons.
  local png
  for png in "${staged}"/hicolor/*/apps/grok-bot.png; do
    [[ -f "${png}" ]] || continue
    install -Dm644 "${png}" \
      "${pkgdir}/usr/share/icons/hicolor/${png##*/hicolor/}"
  done

  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<LICENSE
Grok Bot is proprietary software. This package repacks the official
Linux .deb published by xAI (resolved via downloads.cursor.com) into the
tarball at https://github.com/Nichokas/grokbot-linux-port/releases.
See upstream terms at https://grok.com and inside resources/app.asar.
LICENSE

  if [[ -f "${pkgdir}/opt/${pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  fi
}
