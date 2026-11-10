pkgname=zaptide-bin
pkgver=0.8.0
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
sha256sums=('a30f301014bd59e3bcc16437a9bd3c4d118cd6d90964b3672e8ccbd10ad8dda7')
sha256sums_x86_64=('6468865daf4b687ca80016fc641885358c7750bd59339be8df9e832861ad7048')
sha256sums_aarch64=('a4a565203e7f91d401f8def4c38d03d09ba82346c362d53c81b36a4fe7c8edfd')
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
