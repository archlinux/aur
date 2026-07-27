# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gale
pkgver=1.19.1
pkgrel=1
pkgdesc="A modern mod manager for Thunderstore"
arch=('x86_64')
url="https://github.com/Kesomannen/gale"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('90a39de2e9e2c95b2676249b34abc957acc4aa401872f5c0938a72aa3bf5a712'
            '52abef25674537cd97783ae8dfa97e3569305856bea094c43862ec82d6e21360')

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
  cargo tauri build --no-bundle -- --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "assets/$pkgname-mime.xml" \
    "$pkgdir/usr/share/mime/packages/$pkgname.xml"

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
