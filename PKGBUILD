# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=convco
pkgver=0.6.3
pkgrel=1
pkgdesc='Conventional commits, changelog, versioning, validation'
url='https://convco.github.io'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'libgit2')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/convco/convco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea178bb268e45d507fd358e391fd6bbb552b8d9f6801f0193b4422e172fc6917')
b2sums=('2287ba4d957a2549297b5eecbd5fbe1c115c6e24d39ece986a539be7a7b50b06191ddfb8566f353fb0ba21a2dd82566fa6be30f87d86b127200fdfff0e5e569c')

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
