# Maintainer: Max <max at swk-web.com>

pkgname=brows3
pkgver=0.2.44
pkgrel=1
pkgdesc="Super fast open-source S3 browser, S3 explorer, and desktop client for Amazon S3, MinIO, Cloudflare R2, Wasabi, and other S3-compatible storage"
arch=('x86_64' 'aarch64')
url="https://github.com/rgcsekaraa/brows3"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libappindicator-gtk3'
  'librsvg'
  'hicolor-icon-theme'
)
makedepends=(
  'rust'
  'cargo'
  'nodejs'
  'pnpm'
  'patchelf'
  'cmake'
  'nasm'
  'jq'
)
options=('!lto' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgcsekaraa/brows3/archive/refs/tags/app-v${pkgver}.tar.gz")
sha256sums=('db309ab0f45f20032671754cc521d4cc28985f7f52490b3eb3f71eab17911431')

prepare() {
  cd "$pkgname-app-v$pkgver"

  # Disable updater artifact creation; pacman manages updates for AUR packages.
  local conf=src-tauri/tauri.conf.json
  jq '.bundle.createUpdaterArtifacts = false' "$conf" > "$conf.tmp"
  mv "$conf.tmp" "$conf"

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked \
    --target "$(rustc -vV | sed -n 's/host: //p')" \
    --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "$pkgname-app-v$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export NODE_ENV=production

  pnpm install --frozen-lockfile
  pnpm tauri build --bundles deb
}

package() {
  cd "$pkgname-app-v$pkgver"

  install -Dm755 src-tauri/target/release/brows3 \
    "$pkgdir/usr/bin/brows3"

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/brows3.png"
  install -Dm644 src-tauri/icons/64x64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/brows3.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/brows3.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/brows3.png"

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/brows3.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Brows3
Comment=Super fast S3 browser and desktop client
Exec=brows3
Icon=brows3
Terminal=false
Type=Application
Categories=Utility;FileManager;
Keywords=S3;AWS;MinIO;R2;Cloudflare;Wasabi;Cloud;Storage;
DESKTOP

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
