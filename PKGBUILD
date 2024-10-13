# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=convco
pkgver=0.6.1
pkgrel=2
pkgdesc='Conventional commits, changelog, versioning, validation'
url='https://convco.github.io'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libgit2')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/convco/convco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed68341e065f76f22b6d93ff3686836a812f6a031dc7ee00bed7e048b0da4294')
b2sums=('c9904a2c5d929789e413a3a18ece61f17bf7ba4ff8e4983442b5ec11445f1561c200410820d347be2d0bb23b8a20212b401cd66998bfbcbee37d014b11b06545')

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
