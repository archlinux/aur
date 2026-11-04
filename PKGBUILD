pkgname=zaptide
pkgver=0.7.4
pkgrel=1
pkgdesc="Native WhatsApp client built with GTK4 and libadwaita"
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
  'openssl'
  'pango'
  'sqlcipher'
)
makedepends=('cargo' 'cmake' 'gettext' 'pkgconf' 'rust>=1.98')
optdepends=(
  'gst-libav: additional video codecs'
  'org.freedesktop.secrets: store the archive encryption key'
  'xdg-desktop-portal: desktop integration and attachment selection'
)
conflicts=('zaptide-bin' 'zaptide-git')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e9b67f6a7bcdb045e587db74bb5221ca2f5dbdf7f51e87c9b8b05c712acd59b0')

prepare() {
  cd "zaptide-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "zaptide-${pkgver}"
  # Override the crates' bundled SQLCipher and OpenSSL builds.
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export OPENSSL_NO_VENDOR=1
  cargo build --release --frozen --bin zaptide
  local lang
  for lang in $(cat po/LINGUAS); do
    msgfmt -o "po/${lang}.mo" "po/${lang}.po"
  done
}

package() {
  cd "zaptide-${pkgver}"
  install -Dm755 target/release/zaptide "${pkgdir}/usr/bin/zaptide"
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
  install -Dm644 packaging/flatpak/dev.luminusos.ZapTide.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/dev.luminusos.ZapTide.metainfo.xml"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
