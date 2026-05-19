# Maintainer: xbz7

pkgname=crumble
pkgver=1.2.0
pkgrel=1
pkgdesc="A file packing and encryption tool. Pack files into encrypted .crumbs files, share them, and unpack on another machine."
arch=('x86_64')
url="https://github.com/xbz-seven/Crumble"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'glib2'
  'librsvg'
  'cairo'
  'gdk-pixbuf2'
  'pango'
  'libx11'
  'shared-mime-info'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'npm'
  'rust'
  'base-devel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')
install="${pkgname}.install"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  npm ci
  npm run build

  export RUSTFLAGS="--remap-path-prefix=${srcdir}=/usr/src/${pkgname}"
  export TAURI_DEBUG=false
  cargo build --release --manifest-path src-tauri/Cargo.toml
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "src-tauri/target/release/crumble" \
    "${pkgdir}/usr/bin/crumble"

  install -Dm644 "Logo.png" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/crumble.png"

  install -Dm644 "Format.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-x-crumble.png"

  install -Dm644 "src-tauri/crumble-mime.xml" \
    "${pkgdir}/usr/share/mime/packages/crumble.xml"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/crumble.desktop" <<EOF
[Desktop Entry]
Categories=Utility;Archiver;Security;
Comment=Pack and unpack .crumbs files
Exec=crumble
MimeType=application/x-crumble
StartupWMClass=crumble
Icon=crumble
Name=Crumble
Terminal=false
Type=Application
EOF
}
