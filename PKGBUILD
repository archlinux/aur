# Maintainer: gilcu3
# Previous: Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>
# Contributor: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

_pkgname=cup
pkgname=$_pkgname-docker
pkgver=3.4.2
pkgrel=1
pkgdesc="Cup is the easiest way to check for container image updates."
url="https://github.com/sergi0g/cup"
makedepends=('cargo' 'bun' 'typescript')
arch=('x86_64' 'aarch64')
license=('AGPL-3')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sergi0g/cup/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c501c86c5d558745b03f3aa4bdfc0d3f1aef2fca6e127c47dd19928936a2d4f9')
options=(!lto)
prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
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
