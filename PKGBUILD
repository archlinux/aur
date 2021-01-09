# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=trunk
pkgver=0.7.4
pkgrel=1
pkgdesc="Build, bundle & ship your Rust WASM application to the web."
arch=(x86_64)
url="https://github.com/rustwasm/wasm-bindgen"
license=(APACHE MIT)
depends=(
rust-wasm
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thedodd/trunk/archive/v${pkgver}.tar.gz")
sha256sums=('cab41516583250624e12b0e78379935d60d5fc46cfa4aead8746d119ac615406')

prepare() {
  cd trunk-${pkgver}
  export CARGO_HOME="${srcdir}/cargo_home"
  cargo fetch --locked
}

build() {
  cd trunk-${pkgver}
  export CARGO_HOME="${srcdir}/cargo_home"
  cargo build --release --offline --all-features --target-dir=target
}

check() {
  cd trunk-${pkgver}
  export CARGO_HOME="${srcdir}/cargo_home"
  cargo test --release --offline --target-dir=target
}

package(){
  cd trunk-${pkgver}
  find target/release -maxdepth 1 -executable -type f -exec install -Dm 755 "{}" -t "${pkgdir}"/usr/bin \;
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE-MIT
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE-APACHE
}

