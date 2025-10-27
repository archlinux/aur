# Maintainer: gilcu3
# Previous: Maintainer: Michael Clayfield <me asdf michaelclayfield asdf com asdf>
# Contributor: Michael Clayfield <me asdf michaelclayfield asdf com asdf>

_pkgname=cup
pkgname=$_pkgname-docker
pkgver=3.4.3
pkgrel=1
pkgdesc="Cup is the easiest way to check for container image updates."
url="https://github.com/sergi0g/cup"
makedepends=('cargo' 'bun' 'typescript')
arch=('x86_64' 'aarch64')
license=('AGPL-3')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sergi0g/cup/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('480c5f63e6ebb862fd6eb65fbff472b79c066b66b7110f7ebf380b50b1465a18')
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
