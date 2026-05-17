# Maintainer: xbz7

pkgname=crumble
pkgver=0.1.0
pkgrel=1
pkgdesc="A file packing and encryption tool. Pack files into encrypted .crumbs files, share them, and unpack on another machine."
arch=('x86_64')
url="https://github.com/xbz7/crumble"
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
)
makedepends=(
  'cargo'
  'npm'
  'rust'
  'base-devel'
)
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  npm ci --omit=optional
  npm run build

  export RUSTFLAGS="--remap-path-prefix=${srcdir}=/usr/src/${pkgname}"
  cargo build --release --manifest-path src-tauri/Cargo.toml
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "src-tauri/target/release/crumble" \
    "${pkgdir}/usr/bin/crumble"

  install -Dm644 "src-tauri/icons/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/crumble.png"

  install -Dm644 "src-tauri/icons/128x128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/crumble.png"

  install -Dm644 "src-tauri/icons/32x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/crumble.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/crumble.desktop" <<EOF
[Desktop Entry]
Categories=Utility;Archiver;Security;
Comment=Pack and unpack .crumbs files
Exec=crumble
StartupWMClass=crumble
Icon=crumble
Name=Crumble
Terminal=false
Type=Application
EOF
}
