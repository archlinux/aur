# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=flip-link
pkgver=0.1.7
pkgrel=1
pkgdesc="Flips the memory layout of embedded programs to protect against stack overflows"
url="https://github.com/knurling-rs/flip-link"
license=('Apache' 'MIT')
arch=('x86_64' 'i686' 'aarch64' 'arm')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/knurling-rs/flip-link/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37236451f4392d3f44cd6a818b038ce10f2673be10dedef02f8410507ec5fec6')
b2sums=('e1232cf0f173abe83eeb894b2062820394ce6ff20ed817f7af1cedf23320f508f57d23e9801957741b46b556910e8611af6bb60f7fa68cea224544ded1058d68')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

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
    target/release/flip-link

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-{APACHE,MIT}
}
