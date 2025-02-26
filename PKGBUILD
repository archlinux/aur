# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=convco
pkgver=0.6.2
pkgrel=1
pkgdesc='Conventional commits, changelog, versioning, validation'
url='https://convco.github.io'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libgit2')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/convco/convco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f8e58f8572a785e32d287cad80d174303a5db5abc4ce0cf50022e05125549dd')
b2sums=('aadd837b395fd366765847696befb7e3ac185120837c7d56ba7bbfc94a8fc120e49d3bf288463bc4395aaed99cdf986fba5c798e702338548af224334a8cad96')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  export LIBGIT2_NO_VENDOR=1

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/convco

  install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d" \
    target/completions/convco.fish
  install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions" \
    target/completions/_convco
  install -Dm0644 -t "$pkgdir/usr/share/elvish/lib" \
    target/completions/convco.elv
  install -Dm0644 target/completions/convco.bash \
    "$pkgdir/usr/share/bash-completion/completions/convco"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
