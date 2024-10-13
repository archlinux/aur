# Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

_pkgname=cup
pkgname=$_pkgname-docker
pkgver=2.4.0
pkgrel=1
pkgdesc="Cup is the easiest way to check for container image updates."
url="https://github.com/sergi0g/cup"
makedepends=('cargo' 'bun' 'typescript')
arch=('x86_64' 'aarch64')
license=('MIT')
source=("https://github.com/sergi0g/cup/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a8f983b890fdf6d1198e5c49882889347cfe9d3ed9fdd3c39d473280f663a0c3')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"/web/
  bun install
  bun run build
  cp -r dist/ ../src/static
  cd ../
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/$_pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
