# Maintainer: Natetronn
# AUR package built from the tagged source on GitHub (penates-bin installs the prebuilt release instead).
# pkgver and sha256sums are updated by scripts/publish-release.py for each release.
pkgname=penates
pkgver=0.1.5
pkgrel=1
pkgdesc="Turn websites into desktop apps with their own window, icon and login"
arch=('x86_64' 'aarch64')
url="https://github.com/Natetronn/penates"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('cargo')
optdepends=('xdg-utils: open links and downloads in your browser')
conflicts=('penates-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Natetronn/penates/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14d42204f132d4dc60029c96340959c2fa9a2bc8bc72dd37ab86ff9d5f948695')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Downloads the crates pinned in Cargo.lock, so build() needs no network.
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  # Keep the build folder's path out of the binaries.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
  # custom-protocol embeds the manager's page in the program
  cargo build --frozen --release --workspace --features penates-desktop/custom-protocol
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/penates         "$pkgdir/usr/bin/penates"
  install -Dm755 target/release/penates-desktop "$pkgdir/usr/bin/penates-desktop"
  install -Dm644 packaging/penates.desktop      "$pkgdir/usr/share/applications/penates.desktop"
  for s in 32 64 128; do
    install -Dm644 "src-tauri/icons/${s}x${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/penates.png"
  done
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/penates.png"
  install -Dm644 src-tauri/icons/icon.png       "$pkgdir/usr/share/icons/hicolor/512x512/apps/penates.png"
  install -Dm644 src-tauri/icons/icon.svg       "$pkgdir/usr/share/icons/hicolor/scalable/apps/penates.svg"
  install -Dm644 LICENSE                        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-LICENSES.txt       "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.txt"
}
