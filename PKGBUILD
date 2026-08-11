# Maintainer: Parsiad Azimzadeh <parsiad.azimzadeh at gmail dot com>
# Maintainer: mothran
# Official downloads: https://chatgpt.com/codex/

pkgname=openai-codex-desktop
pkgver=26.803.81509
pkgrel=7
pkgdesc="Official ChatGPT desktop app with Codex"
arch=('x86_64')
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
provides=('chatgpt')
conflicts=('chatgpt')
options=('!debug' '!strip')

_deb="chatgpt_${pkgver}_amd64.deb"
source=(
  "${_deb}::https://persistent.oaistatic.com/codex-app-prod/linux/deb/latest/chatgpt_amd64.deb"
  'chatgpt-launcher.sh'
)
noextract=("${_deb}")
sha256sums=('a9bf91a368f9f7c4eea38082a9fb8fb46b8d005b719a6d7715d2e5a1982c38eb'
            '4e3ca9302600bed268f8fd3ba2c9ac2f1ceb99da139ed71c50db0289b118d06f')

package() {
  cd "${srcdir}"

  bsdtar -xOf "${_deb}" data.tar.xz |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  rm "${pkgdir}/usr/bin/chatgpt"
  install -Dm755 chatgpt-launcher.sh "${pkgdir}/usr/bin/chatgpt"
  ln -s chatgpt "${pkgdir}/usr/bin/codex-desktop"

  install -Dm644 "${pkgdir}/usr/share/doc/chatgpt/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

  # Debian package-policy files are not used on Arch Linux.
  rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
}
