# Maintainer: Akira <akira.uestc at gmail dot com>
# Releases (x86_64): https://persistent.oaistatic.com/codex-app-prod/linux/deb/dists/stable/main/binary-amd64/Packages
# Releases (aarch64): https://persistent.oaistatic.com/codex-app-prod/linux/deb/dists/stable/main/binary-arm64/Packages

pkgname=chatgpt-desktop
pkgver=26.825.41651
pkgrel=1
pkgdesc="ChatGPT desktop application for Linux (repackaged from the official binary)"
arch=('x86_64' 'aarch64')
url="https://chatgpt.com/download"
license=('LicenseRef-custom')
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
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'sh'
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
source=('chatgpt-launcher.sh')
noextract=(
  "chatgpt_${pkgver}_amd64.deb"
  "chatgpt_${pkgver}_arm64.deb"
)
sha256sums_x86_64=('21b22e95c0c43a3f114f3ed32692abedc638f4057a08f98c98836e2d3e9a671e')
sha256sums_aarch64=('e9e8cab46da3f0f345a5df4a9f889778ce7e2c4802ce1ce6d5cebad9493baeb5')
sha256sums=('aab6b1105d7273443234e77412fbaa35ff9e04098ac63c2f73ae8e87afb43bd2')

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

  install -Dm644 "${pkgdir}/usr/share/doc/chatgpt/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  ln -s /usr/lib/chatgpt/LICENSES.chromium.html \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
}
