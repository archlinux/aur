pkgname=zaptide-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Native WhatsApp client built with GTK4 and libadwaita (upstream binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/luminusOS/zaptide"
license=('MIT')
depends=(
  'alsa-lib'
  'bubblewrap'
  'cairo'
  'fontconfig'
  'gcc-libs'
  'glib2'
  'glibc'
  'glycin'
  'graphene'
  'gst-plugins-base'
  'gst-plugins-good'
  'gstreamer'
  'gtk4>=4.14'
  'libadwaita>=1.10'
  'libseccomp'
  'pango'
)
makedepends=('gettext')
optdepends=(
  'gst-libav: additional video codecs'
  'org.freedesktop.secrets: store the archive encryption key'
  'xdg-desktop-portal: desktop integration and attachment selection'
)
provides=("zaptide=${pkgver}")
conflicts=('zaptide' 'zaptide-git')
options=('!debug' '!strip')
source=("dev.luminusos.ZapTide-${pkgver}.metainfo.xml::https://raw.githubusercontent.com/luminusOS/zaptide/v${pkgver}/packaging/flatpak/dev.luminusos.ZapTide.metainfo.xml")
sha256sums=('8e7db7728572483362cda469c928555c35798c779a7e4ab880409a4f4edd2cb5')
sha256sums_x86_64=('dad383920de05aafe13d2a930dbb167cd2134bd3ae2dbfbd9747349d01db324b')
sha256sums_aarch64=('b3d904156fa43608b8942d88679b8d782bcce11d807683d16e7a6358187bf61d')
source_x86_64=("${url}/releases/download/v${pkgver}/zaptide-v${pkgver}-x86_64-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/zaptide-v${pkgver}-aarch64-linux-gnu.tar.gz")

# Use the native archive, which contains no bundled shared libraries or launcher.
# SQLCipher, OpenSSL and libopus are statically linked by upstream.
build() {
  cd "zaptide-v${pkgver}-${CARCH}-linux-gnu"
  local lang
  for lang in $(cat po/LINGUAS); do
    msgfmt -o "po/${lang}.mo" "po/${lang}.po"
  done
}

package() {
  cd "zaptide-v${pkgver}-${CARCH}-linux-gnu"
  install -Dm755 zaptide "${pkgdir}/usr/bin/zaptide"
  install -Dm644 data/dev.luminusos.ZapTide.desktop \
    "${pkgdir}/usr/share/applications/dev.luminusos.ZapTide.desktop"
  sed -i 's/^Icon=zaptide$/Icon=dev.luminusos.ZapTide/' \
    "${pkgdir}/usr/share/applications/dev.luminusos.ZapTide.desktop"
  install -Dm644 data/icons/zaptide.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dev.luminusos.ZapTide.svg"
  local icon lang
  for icon in zaptide-symbolic zaptide-unread-symbolic; do
    install -Dm644 "data/icons/${icon}.svg" \
      "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${icon/zaptide/dev.luminusos.ZapTide}.svg"
  done
  for lang in $(cat po/LINGUAS); do
    install -Dm644 "po/${lang}.mo" \
      "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/zaptide.mo"
  done
  install -Dm644 "${srcdir}/dev.luminusos.ZapTide-${pkgver}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/dev.luminusos.ZapTide.metainfo.xml"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
