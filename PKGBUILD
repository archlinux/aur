# Maintainer: Akira <akira dot uestc at gmail dot com>

pkgname=notra
pkgver=0.1.8
pkgrel=1
pkgdesc="Lightweight, fast desktop editor for text and Markdown"
arch=('x86_64')
url="https://github.com/syscryer/Notra"
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'libgcc'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'sqlite'
  'wayland'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'nodejs'
  'npm'
)
# ring's C/assembly objects cannot be linked by rust-lld with GCC LTO enabled.
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz"
  "$pkgname.desktop"
  'disable-self-update.patch'
  'use-system-sqlite.patch'
  'use-https-for-npm-git-dependency.patch'
)
sha256sums=(
  'c3ccbbe020dad264741f6dd2ecd710b401c1953bcbf533d9ac9b59872301ccc6'
  '3fbb04d0ce5a5521c58e01204bbe0b7cf079fd984faaf14d7ceea80ade288993'
  'bece95f77f19f9e9f634b44a8b85a1389f178f0d181139bf6482f1f9bd313b2e'
  '76d76baf83de33eaa8914ac898009c6ce83c5e14248ebcb0898ef2f77d814e8b'
  '3aa4157555f743985e5a4784691d1058f606c390d1f2344687c33ae51a85e0f6'
)

prepare() {
  cd "Notra-$pkgver"

  patch -Np1 -i "$srcdir/disable-self-update.patch"
  patch -Np1 -i "$srcdir/use-system-sqlite.patch"
  patch -Np1 -i "$srcdir/use-https-for-npm-git-dependency.patch"

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  cd crates/notra-app/frontend
  npm ci --include=dev --allow-git=all --cache "$srcdir/npm-cache" \
    --no-audit --no-fund
}

build() {
  cd "Notra-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"

  npm --prefix crates/notra-app/frontend run build
  cargo build --frozen --release --package notra-app --features custom-protocol
}

check() {
  cd "Notra-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"

  npm --prefix crates/notra-app/frontend run test:keybindings
  npm --prefix crates/notra-app/frontend run test:markdown
  cargo test --frozen --workspace
}

package() {
  cd "Notra-$pkgver"

  install -Dm755 "$srcdir/target/release/notra" "$pkgdir/usr/bin/notra"
  install -Dm644 "$srcdir/notra.desktop" \
    "$pkgdir/usr/share/applications/notra.desktop"
  install -Dm644 crates/notra-app/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/notra.png"
  install -Dm644 crates/notra-app/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/notra.png"
  install -Dm644 crates/notra-app/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/notra.png"
  install -Dm644 crates/notra-app/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/notra.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
