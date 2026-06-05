# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=searchmonkey
pkgver=0.3.1
pkgrel=1
pkgdesc="Real-time search for real files. No index. No daemon. No stale results."
arch=('x86_64')
url="https://searchmonkey.dev"
license=('MIT')
depends=(
  'gtk3'
  'libsoup3'
  'ripgrep'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'cargo-tauri'
  'pnpm'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/cottrela/searchmonkey-III/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        'pnpm-workspace.yaml')
sha256sums=('9252a19347fd9c31f453b5748e0c2a4a16185b0f18435c26c7adef868385c6a6'
            '0d0ff90ae4de6eee27b57a3e7706da86fb89df80f3b693554428d76ac797144a'
            'ac02d96368617c760f093cfe61fdec64b6244007ab3553e0d6621f706f54a353')

prepare() {
  cp -f pnpm-workspace.yaml "$pkgname-III-$pkgver/"

  cd "$pkgname-III-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install --frozen-lockfile

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path src-tauri/Cargo.toml --locked --target host-tuple
}

build() {
  cd "$pkgname-III-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export PNPM_HOME="$srcdir/pnpm-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Symlink system ripgrep binary
  mkdir -p "src-tauri/binaries/rg-${CARCH}-unknown-linux-gnu/"
  ln -s /usr/bin/rg "src-tauri/binaries/rg-${CARCH}-unknown-linux-gnu/"

  cargo tauri build --no-bundle -- --frozen
}

package() {
  cd "$pkgname-III-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname" -t "$pkgdir/usr/bin/"

  for i in 32x32 64x64 128x128 128x128@2x; do
    install -Dm644 "src-tauri/icons/${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
