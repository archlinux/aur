# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=oranda
pkgver=0.6.3
pkgrel=2
pkgdesc="generate beautiful landing pages for your projects"
url="https://github.com/axodotdev/oranda"
depends=(gcc-libs oniguruma tailwindcss)
makedepends=(cargo)
arch=(i686 x86_64)
license=(APACHE MIT)
# Pulls the entire workspace because otherwise various paths in oranda's
# workspace dependencies don't resolve right
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('de22d327b1f5ea674d16c50a7472d827c7f7a834bee747e1d15a4f82d3e6a42535c64657dac933035e46b3757785ee6f18fdd2f85c0caa6c16b80d10e322c967')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTONIG_SYSTEM_LIBONIG=yes
  export ORANDA_USE_TAILWIND_BINARY=true
  cargo build --frozen --profile dist --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
  install -Dm0755 -t "$pkgdir/usr/bin" "target/dist/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
