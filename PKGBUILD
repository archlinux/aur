# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-i18n
pkgver=0.2.13
pkgrel=1
pkgdesc="Cargo sub-command to extract and build localization resources to embed in your application/library"
url="https://github.com/kellpossible/cargo-i18n"
license=('MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kellpossible/cargo-i18n/archive/refs/tags/v$pkgver.tar.gz"
        fix-Cargo-lock.patch)
sha256sums=('93aa18ff40ae906c5e80eb813c04d7ef65972465c73e5fd8ed6eed463b14ee98'
            '33312284953d96b6003f1077a866bf9630982056c931ffd9b25f37a343569980')
b2sums=('80d63064a04b430be50bfee2c5e417b51411f21b0abfb9739928c3b4a205a17f1e0ff645cff147d12bce2efbb717bf64433717aa35245384af4d4a8a42454318'
        '1c453fe1d769333b03039f92b8e82a798b605982d4bb14eaafea7f870b5626f4f1546ae181f9f0fe460d1eafa43942abf90ea15421025ddab8e503a924251ea6')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/fix-Cargo-lock.patch"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --bin cargo-i18n --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/cargo-i18n

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
