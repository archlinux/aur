# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gale
pkgver=1.13.6
pkgrel=1
pkgdesc="A modern mod manager for Thunderstore"
arch=('x86_64')
url="https://kesomannen.com/gale"
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'cargo-tauri'
  'pnpm'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kesomannen/gale/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('ba8ab533d183e3f72cedbe9a10e5709753eb9b58ca70403174e03404d2fd4388'
            '4de7796da59ef55bf7bbcde65a53b051245f80b3284ab53be20c4728345c4ff1')

prepare() {
  cd "$pkgname-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install --frozen-lockfile

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path src-tauri/Cargo.toml --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export PNPM_HOME="$srcdir/pnpm-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # config::bepinex::tests::check_from_string ... FAILED
  cargo tauri build --no-bundle -- --frozen || :
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --manifest-path src-tauri/Cargo.toml --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname" -t "$pkgdir/usr/bin/"

  for i in 32x32 128x128 128x128@2x; do
    install -Dm644 "src-tauri/icons/${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 images/icons/app-icon@0,25x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/icon.png \
      "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
