# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=kani-verifier
pkgver=0.44.0
pkgrel=1
pkgdesc='Bit-precise model checker for Rust'
arch=('x86_64' 'aarch64')
url="https://github.com/model-checking/kani"
license=('MIT' 'Apache')
makedepends=(rust cargo coreutils sed gcc)
depends=(gcc-libs glibc)
provides=(kani cargo-kani)
conflicts=(kani cargo-kani)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('771ecd8ed1ce8494263f661cc4e3d2f61e7d6774564d2eca7dfc27fcabb31753')
_src="${pkgname}-${pkgver}"

prepare() {
  cd "${_src}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
  cd "${_src}" 
  export CARGO_TARGET_DIR=./target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_src}"
  cargo test --frozen --all-features
}

package() {
  cd "${_src}"

  find target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +

  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
