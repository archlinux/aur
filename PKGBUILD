# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ytubic
pkgver=0.9.2
pkgrel=1
pkgdesc="Fast, responsive YouTube Music desktop client"
arch=('x86_64')
#url="https://github.com/NUber-dev/YTubic
url="https://github.com/ameenalasady/YTubic"
license=('GPL-3.0-or-later')
depends=(
  'gst-libav'
  'gst-plugins-good'
  'gstreamer'
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'cargo-tauri'
  'pnpm'
)
source=("YTubic-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('6a46a1dc972b7c5fd00f931730bbdbcd35849716aca4bb08a022785faf4b52d6'
            '70c6737b1daa8a7524a62934cf9067c976db12fb7a016226cd2debba440d4c4c')

prepare() {
  cd "YTubic-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install --frozen-lockfile

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path src-tauri/Cargo.toml --locked --target host-tuple
}

build() {
  cd "YTubic-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export PNPM_HOME="$srcdir/pnpm-home"
  export OPENSSL_NO_VENDOR=1
  export RUSTUP_TOOLCHAIN=stable
  cargo tauri build --no-bundle -- --frozen
}

check() {
  cd "YTubic-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm test
}

package() {
  cd "YTubic-$pkgver/src-tauri"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

  for i in 32x32 64x64 128x128 128x128@2x; do
    install -Dm644 "icons/${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}/apps/$pkgname.png"
  done
  install -Dm644 icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$srcdir/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"
}
