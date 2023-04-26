# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nix-melt
pkgver=0.1.2
pkgrel=1
pkgdesc='A ranger-like flake.lock viewer'
url='https://github.com/nix-community/nix-melt'
license=('MPL2')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nix-melt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('acfb4fd25d5b72dc34e7d793cacd5fec8a0ddd695fa8d05a17f7674024e0d5c3')
b2sums=('eb6c61a67a55122b147870ddc4b6e62bfad0354e4db6b5b5ed6ebe9f5125af891db88295398fae832f7dd7e9ac05d90cbb37cc6799fd3a1db3f1ca430636c5b9')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
  GEN_ARTIFACTS="artifacts" \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/nix-melt

  install -Dm0644 "artifacts/nix-melt.1" "$pkgdir/usr/share/man/man1/nix-melt.1"
  install -Dm0644 "artifacts/nix-melt.bash" "$pkgdir/usr/share/bash-completions/nix-melt"
  install -Dm0644 "artifacts/nix-melt.fish" "$pkgdir/usr/share/fish/vendor_completions.d/nix-melt.fish"
  install -Dm0644 "artifacts/_nix-melt" "$pkgdir/usr/share/zsh/site-functions/_nix-melt"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
