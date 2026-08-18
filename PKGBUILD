# Maintainer: czyt <czytcn@gmail.com>
# Official downloads: https://chatgpt.com/codex/

pkgname=chatgpt-desktop-app-bin
pkgver=26.814.41957
pkgrel=1
pkgdesc="Official ChatGPT desktop app with Codex"
arch=('x86_64' 'aarch64')
url="https://chatgpt.com/codex/"
license=('custom')

depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libglvnd'
  'libnotify'
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
  'xdg-utils'
  'xz'
)

optdepends=(
  'apparmor: load the bundled user-namespace profile on AppArmor systems'
  'git: version control integration'
)

makedepends=('libarchive')
provides=('chatgpt' 'chatgpt-desktop-app' 'openai-codex-desktop')
conflicts=('chatgpt' 'chatgpt-desktop-app' 'codex-desktop-app' 'openai-codex-desktop')
replaces=('codex-desktop-app')
options=('!debug' '!strip')

_deb_x86_64="chatgpt_${pkgver}_amd64.deb"
_deb_aarch64="chatgpt_${pkgver}_arm64.deb"
source=('chatgpt-launcher.sh')
source_x86_64=(
  "${_deb_x86_64}::https://persistent.oaistatic.com/codex-app-prod/linux/deb/latest/chatgpt_amd64.deb"
)
source_aarch64=(
  "${_deb_aarch64}::https://persistent.oaistatic.com/codex-app-prod/linux/deb/latest/chatgpt_arm64.deb"
)
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums=('56a14509725adb2ab66c6218295030f56470ecd4ca66fb47b6355809903b7382')
sha256sums_x86_64=('4778b26a7abd08647214d5b05c17bd3ebe2d9688d146dabf017c1a2faf93ac7d')
sha256sums_aarch64=('8c40b31419dd4f4a8eb292d40dc3f8a418807dfe8c0101ae7164fa4ee415f818')

package() {
  cd "${srcdir}"

  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"

  bsdtar -xOf "${deb}" data.tar.xz |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  rm "${pkgdir}/usr/bin/chatgpt"
  install -Dm755 chatgpt-launcher.sh "${pkgdir}/usr/bin/chatgpt"
  ln -s chatgpt "${pkgdir}/usr/bin/codex-desktop"

  install -Dm644 "${pkgdir}/usr/share/doc/chatgpt/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

  # Debian package-policy files are not used on Arch Linux.
  rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
}
