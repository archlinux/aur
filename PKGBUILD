# Maintainer: Alp Sahin <alp@sahin.club>
pkgname=brain-fm
_reponame=brain-fm-linux
pkgver=0.1.1
pkgrel=1
pkgdesc="Unofficial Brain.fm desktop app (Tauri) with MPRIS media-key support and a system tray"
arch=('x86_64')
url="https://github.com/AlpSha/brain-fm-linux"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
makedepends=('cargo' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlpSha/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e9ff8285f4f7dcac8e46cb7939d5476e1fa0162ce2592ede97e71d9ccd2ef08')

prepare() {
  cd "$_reponame-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_reponame-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_reponame-$pkgver"

  install -Dm755 "src-tauri/target/release/brain-fm" \
    "$pkgdir/usr/bin/brain-fm"

  install -Dm644 "packaging/brain-fm.desktop" \
    "$pkgdir/usr/share/applications/brain-fm.desktop"

  install -Dm644 "src-tauri/icons/32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/brain-fm.png"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/brain-fm.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/brain-fm.png"
  install -Dm644 "src-tauri/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/brain-fm.png"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
