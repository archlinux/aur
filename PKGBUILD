# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ytubic
pkgver=0.5.0
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
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'cargo-tauri'
  'pnpm'
)
source=("YTubic-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('64d5e4d8dd683061db2671f1f70c56466a6ef492d2c281117977f077ee337d5a'
            '78dfec967328e728e85d89e7d5c810170712a893a88fa8a8792a1d202f663541')

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
