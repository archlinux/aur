# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gale
pkgver=1.12.0
pkgrel=1
pkgdesc="A modern mod manager for Thunderstore"
arch=('x86_64')
url="https://kesomannen.com/gale"
license=('GPL-3.0-or-later')
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
sha256sums=('21b8ee0740fb268557d0e690a8df19c64a4f0dcbc5abdb0b848f488b2461948d'
            '4de7796da59ef55bf7bbcde65a53b051245f80b3284ab53be20c4728345c4ff1')

prepare() {
  cd "$pkgname-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export PNPM_HOME="$srcdir/pnpm-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  pnpm install
  cargo tauri build --no-bundle
}

check() {
  cd "$pkgname-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname" -t "$pkgdir/usr/bin/"

  for i in 32x32 128x128 128x128@2x; do
    install -Dm644 "src-tauri/icons/${i}.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 images/icons/app-icon@0,25x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/icon.png -t \
      "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
