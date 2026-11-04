# Maintainer: Michał Gawron <mgawron@metacode.pl>

pkgname=eveconsole-bin
pkgver=0.9.18
pkgrel=2
pkgdesc='Cross-platform EVE Online companion for industry, trading and character management'
arch=('x86_64')
url='https://github.com/kernoeve/EveConsole'
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'glibc'
  'icu'
  'libgcc'
  'libgomp'
  'libice'
  'libsm'
  'libstdc++'
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
  'libxrender'
  'openssl'
  'xdg-utils'
  'zlib'
)
optdepends=(
  'vlc: alarm sounds and speech playback'
  'jack: microphone recording through the bundled PortAudio library'
  'vulkan-icd-loader: GPU acceleration for local Whisper speech recognition'
)
provides=('eveconsole')
conflicts=('eveconsole')
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/EveConsole-linux-x64.tar.gz"
  "eveconsole-${pkgver}.png::https://raw.githubusercontent.com/kernoeve/EveConsole/v${pkgver}/Assets/logo_mark.png"
  'eveconsole.desktop'
)
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=(
  '9f27d9b0d41ef67c89a6f56dac643c799c862f9d76ec93a8c68efa94748aeb82'
  'f17faca48b302dfe46444c4252c8b7b6b62038d39a1d0a79d83b3ee964359922'
  '2d2d974b1ee8e933c63a05d9ef7d163ee9eb8c0b7494f9bb5e519f1ec3129f3b'
)

package() {
  install -dm755 "${pkgdir}/opt/eveconsole" "${pkgdir}/usr/bin"
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/eveconsole" \
    --exclude './runtimes/linux-arm*' \
    --exclude './runtimes/macos-*' \
    --exclude './runtimes/win-*' \
    --exclude './runtimes/vulkan/win-*'
  chmod -R u=rwX,go=rX "${pkgdir}/opt/eveconsole"
  chmod 755 "${pkgdir}/opt/eveconsole/EveConsole"
  ln -s /opt/eveconsole/EveConsole "${pkgdir}/usr/bin/eveconsole"

  install -Dm644 "${srcdir}/eveconsole.desktop" \
    "${pkgdir}/usr/share/applications/eveconsole.desktop"
  install -Dm644 "${srcdir}/eveconsole-${pkgver}.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/eveconsole.png"
}
