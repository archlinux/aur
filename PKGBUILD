# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=r-quick-share
pkgver=0.4.1
pkgrel=1
pkgdesc="Rust implementation of NearbyShare/QuickShare from Android for Linux."
arch=('x86_64')
url="https://github.com/Martichou/rquickshare"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk')
makedepends=('cargo' 'pnpm' 'protobuf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('799cde545de923bf0a1aaaeda0b8e9ba2477daf43102aa1914427a4c83d10d06')

prepare() {
  cd rquickshare-$pkgver
  export PNPM_HOME="$srcdir/pnpm-home"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  pushd frontend
  pnpm i
  popd

  pushd core_lib
  cargo fetch --target "$CARCH-unknown-linux-gnu"
  popd

  # Don't bundle AppImage
  sed -i 's/"targets": "all"/"targets": "deb"/g' frontend/src-tauri/tauri.conf.json
}

build() {
  cd rquickshare-$pkgver
  export PNPM_HOME="$srcdir/pnpm-home"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  pushd frontend
  pnpm build
  popd
}

package() {
  cd rquickshare-$pkgver
  install -Dm755 "frontend/src-tauri/target/release/$pkgname" -t "$pkgdir/usr/bin/"

  for i in 32x32 128x128 128x128@2x; do
    install -Dm644 frontend/src-tauri/icons/${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 frontend/src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "frontend/src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_amd64/data/usr/share/applications/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"
}
