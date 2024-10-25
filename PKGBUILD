# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nix-melt
pkgver=0.1.3
pkgrel=1
pkgdesc='A ranger-like flake.lock viewer'
url='https://github.com/nix-community/nix-melt'
license=('MPL2')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nix-melt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('21eb7508e310a78451450e1853b3a46b2d407f72845a7ab1c343520cbe03512c')
b2sums=('e441f6091525a20188dd7023f1b5542db51115f309b0b97683d3d98f47369c304e0c25566cbdc8bef5a3e1fe35f49f3547c9fd25fef8f944ca7becea66d4d390')

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
  install -Dm0644 "artifacts/nix-melt.bash" "$pkgdir/usr/share/bash-completion/completions/nix-melt"
  install -Dm0644 "artifacts/nix-melt.fish" "$pkgdir/usr/share/fish/vendor_completions.d/nix-melt.fish"
  install -Dm0644 "artifacts/_nix-melt" "$pkgdir/usr/share/zsh/site-functions/_nix-melt"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
