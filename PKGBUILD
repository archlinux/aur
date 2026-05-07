# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=searchmonkey
pkgver=0.2.4
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
        "$pkgname.desktop")
sha256sums=('e87c1cefcbec87a836b7414297cc4e3cb9e68aa4f24ef0f4905a9dadb8027f03'
            '0d0ff90ae4de6eee27b57a3e7706da86fb89df80f3b693554428d76ac797144a')

prepare() {
  cd "$pkgname-III-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install --frozen-lockfile

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path src-tauri/Cargo.toml --target host-tuple
}

build() {
  cd "$pkgname-III-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Symlink system ripgrep binary
  mkdir -p "src-tauri/binaries/rg-${CARCH}-unknown-linux-gnu/"
  ln -s /usr/bin/rg "src-tauri/binaries/rg-${CARCH}-unknown-linux-gnu/"

  cargo tauri build --no-bundle
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
