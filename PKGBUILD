# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gale
pkgver=1.21.0
pkgrel=1
pkgdesc="A modern mod manager for Thunderstore"
arch=('x86_64')
url="https://github.com/Kesomannen/gale"
license=('GPL-3.0-only')
depends=(
  'bzip2'
  'dbus'
  'fontconfig'
  'gtk3'
  'libsoup3'
  'sqlite'
  'webkit2gtk-4.1'
  'xz'
  'zstd'
)
makedepends=(
  'cargo'
  'cargo-tauri'
  'pnpm'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('f0d5fd1c0e7aa6cd0fd03899873e2b44792c81b989685c4ae164ba6907e8f04b'
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
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
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
