# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=cargo-lock
pkgver=11.0.1
pkgrel=1
pkgdesc="Self-contained Cargo.lock parser"
url="https://github.com/rustsec/rustsec/tree/main/cargo-lock"
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
arch=('x86_64')
license=('Apache-2.0 OR MIT')
source=("https://github.com/rustsec/rustsec/archive/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('7941beaf9ba356ea950b74feb2a4da6b73d8525f377c05695e2c1e003593abafb7cdcc1212987af0f401e610aee9338cbcd5410a7a527b29a26f935220fd24a0')

prepare() {
  cd "rustsec-${pkgname}-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo update --offline "${pkgname}" --precise "${pkgver}"  # Lock file may be out of date
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
