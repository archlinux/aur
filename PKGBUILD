# Maintainer: Fabio Fontana (fabifont) <me@fabifont.dev>

pkgname="flatten"
pkgver=0.2.0
pkgrel=1
pkgdesc="Rust CLI and library for exporting a project tree into one deterministic representation"
arch=("x86_64")
url="https://github.com/fabifont/flatten"
license=("MIT" "Apache-2.0")

depends=("gcc-libs")
makedepends=("cargo")

conflicts=("${pkgname}-git" "${pkgname}-bin")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
# The AUR workflow replaces SKIP with fixed checksums before publishing.
sha256sums=('197ea27f97a33a10b44af2583e45db9b4c7770cbe819eeb38346db8d57efbfbc')
b2sums=('5521a218adfff312ab3597b0d1b2f8c784e158008302cc60539552df99a72dc7d09b4082edcbdf382bb690fe724717c30a97c8577728f9cd6a2efb5b8b4229f6')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export CARGO_TARGET_DIR=target

  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen --all-features
}

check() {
  export CARGO_TARGET_DIR=target

  cd "${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
