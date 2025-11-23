# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=kibi
pkgver=0.3.2
pkgrel=1
pkgdesc="A tiny text editor, written in Rust"
url="https://github.com/ilai-deutel/kibi"
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme')
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('MIT OR Apache-2.0')
backup=('etc/kibi/config.ini')
source=("https://github.com/ilai-deutel/kibi/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('150fde4664ebe47a4c588cf8ff2583392c76038339982a7180ee9282ce6c3cf2')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "target/release/kibi" -t "$pkgdir/usr/bin"

  # Install configuration files
  install -Dm644 "config_example.ini" "$pkgdir/etc/kibi/config.ini"
  install -Dm644 syntax.d/* -t "$pkgdir/usr/share/kibi/syntax.d"

  # Install desktop file and logo
  install -Dm644 kibi.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kibi.svg"

  # Install license
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
