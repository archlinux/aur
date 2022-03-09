# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=enquirer
pkgver=0.6.1
pkgrel=1
pkgdesc="Command line utility for stylish interactive prompts"
url="https://github.com/termapps/enquirer"
license=('MIT')
arch=('x86_64' 'i686')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/termapps/enquirer/archive/refs/tags/v$pkgver.tar.gz"
        Cargo.lock)
sha256sums=('b0539686bd8f5807f1f5219a7d5809913fbbf7af73913d169001241ad19b568f'
            'd5771d18324fd91f940736ea27cb4fb84e6663901f16dcdac0d4fed2c2d90b23')
b2sums=('32dc8f097d69b8c092da47d875f3970ab17ef19836c8e9adde0ee66b235858b1ad313bbc07c3682eec0257390ba5f713a9765de8a1a1cfaafcefe9bda85f20db'
        '2c44f124039ced129704c389a7b8cca37ef6f9b7c51ecbbf9c6fb825dad2e1390b75d99df81b6fc0d895eb9750b8a53ad7af54dc9ef3195e0c33ab8d462fe11e')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cp "$srcdir/Cargo.lock" Cargo.lock
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/enquirer

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
