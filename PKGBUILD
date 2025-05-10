# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=lovely-injector
pkgver=0.7.1
pkgrel=1
pkgdesc='A runtime lua injector for games built with LÖVE'
url='https://github.com/ethangreen-dev/lovely-injector'
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethangreen-dev/lovely-injector/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('965a2e24b5041661e8487f8d06ffc93ce5f154b704a4cac080135c2ed253fcba')
b2sums=('b95a64d6bac6d3bff2c5c3fab73fae0205c92ccce51bb4292123f8243494b4e3e980dbbbe580d4fa589a437c319370a10fd9dcedf39c679d2bf4c035fa55bd3a')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release -p lovely-unix --lib
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/lib" \
    target/release/liblovely.so

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
