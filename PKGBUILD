# Maintainer: Akira <akira.uestc at gmail dot com>
# Releases (x86_64): https://persistent.oaistatic.com/codex-app-prod/linux/deb/dists/stable/main/binary-amd64/Packages
# Releases (aarch64): https://persistent.oaistatic.com/codex-app-prod/linux/deb/dists/stable/main/binary-arm64/Packages

pkgname=chatgpt-desktop
pkgver=26.924.22138
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
  'libcanberra'
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
source=('chatgpt-launcher.sh')
noextract=(
  "chatgpt_${pkgver}_amd64.deb"
  "chatgpt_${pkgver}_arm64.deb"
)
sha256sums_x86_64=('ce3bb1aa82ccdfe3037ada2fd8d187796ea4a0d5ed031d0e4ec8adce8b7014e7')
sha256sums_aarch64=('6570f078c5ea25461ce103b2e31fa7dd6c5e717136fa9237c701d22db62b5e3f')
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
