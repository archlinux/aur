# Maintainer: Akira <akira.uestc at gmail dot com>
# Releases (x86_64): https://persistent.oaistatic.com/codex-app-prod/linux/deb/dists/stable/main/binary-amd64/Packages
# Releases (aarch64): https://persistent.oaistatic.com/codex-app-prod/linux/deb/dists/stable/main/binary-arm64/Packages

pkgname=chatgpt-desktop
pkgver=26.1002.52244
pkgrel=1
pkgdesc="ChatGPT desktop application for Linux (repackaged from the official binary)"
arch=('x86_64' 'aarch64')
url="https://chatgpt.com/download"
license=('LicenseRef-OpenAI-Proprietary')
options=('!strip' '!debug')
provides=(
  "chatgpt=${pkgver}"
)
conflicts=(
  'chatgpt'
)

depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libgcc'
  'libglvnd'
  'libnotify'
  'libpulse'
  'libsecret'
  'libstdc++'
  'libusb'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'nspr'
  'nss'
  'openssl'
  'pango'
  'systemd-libs'
  'sh'
  'tpm2-tss'
  'vulkan-driver'
  'xdg-utils'
)

optdepends=(
  'apparmor: automatically load the bundled profile for Chromium user namespaces'
  'git: enable Git repository integration'
  'gtk4: use the GTK 4 backend with --gtk-version=4'
  'kde-cli-tools: move deleted files to the Plasma trash through kioclient'
  'org.freedesktop.secrets: securely store credentials with a Secret Service backend'
  'pipewire: enable WebRTC screen sharing under Wayland'
)

backup=('etc/apparmor.d/chatgpt')
install="${pkgname}.install"

source_x86_64=(
  "chatgpt_${pkgver}_amd64.deb::https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/chatgpt_${pkgver}_amd64.deb"
)
source_aarch64=(
  "chatgpt_${pkgver}_arm64.deb::https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/chatgpt_${pkgver}_arm64.deb"
)
source=(
  'chatgpt-launcher.sh'
  'chatgpt-LICENSE'
)
noextract=(
  "chatgpt_${pkgver}_amd64.deb"
  "chatgpt_${pkgver}_arm64.deb"
)
sha256sums_x86_64=('9498e417131a278bce35bfff6275d252c0d332f17afc0313e0b782749f4d348a')
sha256sums_aarch64=('e9381eaf793379d0f002500286fc6e820ad0fbc273ff958268a849cd500e6ff9')
sha256sums=(
  'aab6b1105d7273443234e77412fbaa35ff9e04098ac63c2f73ae8e87afb43bd2'
  'ddd13d7256e03b29bb3f879f07266ba4d6572c161ccddf7a8a2f82e47b24b2b4'
)

package() {
  local _deb_arch

  case "${CARCH}" in
    x86_64) _deb_arch='amd64' ;;
    aarch64) _deb_arch='arm64' ;;
    *)
      printf 'Unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  bsdtar -xOf "${srcdir}/chatgpt_${pkgver}_${_deb_arch}.deb" data.tar.xz |
    bsdtar --no-same-owner -xJf - -C "${pkgdir}"

  install -Dm755 "${srcdir}/chatgpt-launcher.sh" \
    "${pkgdir}/usr/lib/chatgpt/codex-launcher"

  sed -i "s|<pkgname>chatgpt</pkgname>|<pkgname>${pkgname}</pkgname>|" \
    "${pkgdir}/usr/share/metainfo/com.openai.chatgpt.metainfo.xml" \
    "${pkgdir}/usr/share/swcatalog/xml/com.openai.chatgpt.xml"

  install -Dm644 "${srcdir}/chatgpt-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/share/doc/chatgpt/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  ln -s /usr/lib/chatgpt/LICENSES.chromium.html \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
}
