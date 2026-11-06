# Maintainer: Dylan Forbes <dylandforbes@gmail.com>
pkgname=slinky
pkgver=0.1.0
pkgrel=1
pkgdesc="A utility for wrangling symbolic links on Unix systems"
arch=('x86_64' 'aarch64')
url="https://github.com/fictionic/slinky"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fictionic/slinky/archive/v$pkgver.tar.gz")
sha256sums=('2d063d7491847df42620099a7c81cb53aa4bef1282784e17526d1cd55716f315')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  for bin in "$pkgname" "$pkgname-ln"; do
    install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
    install -Dm644 "generate/$bin.1" "$pkgdir/usr/share/man/man1/$bin.1"
    install -Dm644 "generate/$bin.bash" "$pkgdir/usr/share/bash-completion/completions/$bin"
    install -Dm644 "generate/_$bin" "$pkgdir/usr/share/zsh/site-functions/_$bin"
    install -Dm644 "generate/$bin.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$bin.fish"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
