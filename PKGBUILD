# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>
# Maintainer: Aloso <ludwig.stecher@gmx.de>

pkgname=to-html
pkgver=0.1.5
pkgrel=1
pkgdesc='Render a terminal with ANSI colors as HTML'
arch=(x86_64)
url="https://github.com/Aloso/$pkgname"
license=(MIT)
depends=(util-linux)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('44904aca5c2e09acda1b237ce6e20f033d909f76da6127737a01a3b802302278d2a84ce2946e8bd3f4d59dc2bb6287524b468d7a9d40406f192036fd813c3d4a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install files that are generated with a build script
  find . -name to-html.bash -type f -exec install -Dm644 {} "$pkgdir/user/share/bash-completions/completions/to-html" \;
  find . -name _to-html -type f -exec install -Dm644 {} "$pkgdir/user/share/zsh/site-functions/_to_html" \;
  find . -name sd.fish -type f -exec install -Dm644 {} "$pkgdir/user/share/fish/vendor_completions/to-html.fish" \;
}

# vi: filetype=sh shiftwidth=2 expandtab
