# Maintainer: adelmonte
pkgname=text_expander
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal Wayland text expander compatible with espanso config format"
arch=('x86_64' 'aarch64')
url="https://github.com/adelmonte/text_expander"
license=('GPL-3.0-only')
depends=('wtype' 'libxkbcommon' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('wl-clipboard: clipboard variables')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a41e73c174fef9e3f6e96a4a1849b59c35b50b706353dba759ae38c946317e34')

_host() {
  rustc -vV | sed -n 's/^host: //p'
}

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(_host)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --target "$(_host)"
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --target "$(_host)"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/$(_host)/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
