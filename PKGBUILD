# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=cargo-lock
pkgver=11.1.0
pkgrel=1
pkgdesc="Self-contained Cargo.lock parser"
url="https://github.com/rustsec/rustsec/tree/main/cargo-lock"
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
arch=('x86_64')
license=('Apache-2.0 OR MIT')
source=("https://github.com/rustsec/rustsec/archive/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('7574658cb516e996c29cda356e43c28e052e6c18cf9e27df2e394cb80dd30f1447b76c446c6118e3937534f377728916ad7350295acaa4d6f72d4d3f5cf72871')

prepare() {
  cd "rustsec-${pkgname}-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple --manifest-path "${pkgname}/Cargo.toml"
}

build() {
  cd "rustsec-${pkgname}-v${pkgver}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "rustsec-${pkgname}-v${pkgver}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "rustsec-${pkgname}-v${pkgver}/${pkgname}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
