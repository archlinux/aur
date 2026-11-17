# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=convco
pkgver=0.7.2
pkgrel=1
pkgdesc='Conventional commits, changelog, versioning, validation'
url='https://convco.github.io'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/convco/convco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b73c702e93e9e29f9b57faf497e812a94edb773e2f7d67d7b0481b03464f1b24')
b2sums=('65857aa5d6c51806f92f9b9cfdb34fe2df6ebb0044324d13fba5bdb24e74d5605d56b8d4ef8970ed59519598ff2e76d3e9aee96ccbf2c1914ff623f2d37c341b')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release \
      --no-default-features --features 'gix'
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
