# Maintainer: Sato Ki <satoki at em dot advant dot click>

# Rendered by packaging/aur/render.sh in the Qrious repository; edit the template
# there, not this file.

pkgname=qrious-bin
# The release name as tagged upstream, e.g. 2026.10.0 or 2026.10.0-preview.1.
_version=2026.10.3
# The same name without its hyphen, which pkgver may not contain. Glued rather than
# replaced with "_" so a prerelease sorts below its release in vercmp.
pkgver=2026.10.3
pkgrel=1
pkgdesc="Generate QR codes for Wi-Fi, contacts, URLs, emails, and more"
arch=('x86_64')
url="https://github.com/Samwell9854/qrious"
license=('GPL-3.0-or-later')
depends=(
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'hicolor-icon-theme'
  'libepoxy'
  'libgcc'
  'librsvg'
  'libstdc++'
  'pango'
  'zlib'
)
optdepends=(
  'wl-clipboard: copy and paste QR images on Wayland'
  'xclip: copy and paste QR images on X11'
)
provides=('qrious')
conflicts=('qrious')
# Per-architecture arrays, so another architecture is a second pair beside these.
_dist="qrious-${_version}-linux"
source_x86_64=("${_dist}-x86_64.tar.gz::${url}/releases/download/v${_version}/${_dist}-x86_64.tar.gz")
sha256sums_x86_64=('be2740a2923da64bc1f461eae1a9bfe8cb3cf18ef04c75e1bd42d73eb07895f2')

package() {
  cd "${_dist}-${CARCH}"

  # The Flutter bundle finds lib/ and data/ beside the real path of its executable,
  # so it stays whole under /usr/lib and /usr/bin gets a symlink.
  install -dm755 "${pkgdir}/usr/lib/qrious"
  cp -r --no-preserve=ownership bundle/. "${pkgdir}/usr/lib/qrious/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/qrious/qrious "${pkgdir}/usr/bin/qrious"

  # Desktop entry, AppStream metadata and icons, laid out as under /usr/share.
  install -dm755 "${pkgdir}/usr/share"
  cp -r --no-preserve=ownership share/. "${pkgdir}/usr/share/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
