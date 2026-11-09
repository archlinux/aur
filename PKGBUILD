# Maintainer: smiley <smiley@archlinux.org>

pkgname=rusty-inbox
pkgver=0.2.1
pkgrel=1
pkgdesc='Fast, native email client with a Rust engine, a Qt 6/QML interface and an optional AI assistant'
arch=('x86_64' 'aarch64')
url='https://github.com/karem505/rusty-inbox'
license=('MIT OR Apache-2.0')
depends=(
  'ca-certificates'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-webengine'
)
makedepends=('cargo')
optdepends=(
  'ollama: run the AI assistant locally'
  'xdg-utils: open links and set Rusty Inbox as the mailto handler'
)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5455aa40d12b16cb18426b6ac4b444fc310f9de514385b0737811306a04f6d47')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export QMAKE=/usr/bin/qmake6
  cargo build --frozen --release -p rusty-inbox
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export QMAKE=/usr/bin/qmake6
  cargo test --frozen --release -p rusty-inbox-core -p rusty-inbox-ai
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rusty-inbox -t "$pkgdir/usr/bin"
  install -Dm644 app/packaging/rusty-inbox.desktop -t "$pkgdir/usr/share/applications"
  for s in 16 22 24 32 48 64 96 128 256 512; do
    install -Dm644 "app/packaging/icons/rusty-inbox-$s.png" \
      "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/rusty-inbox.png"
  done
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
