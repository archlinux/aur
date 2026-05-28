# Maintainer: Xuepoo Foter <foter@example.com>
pkgname=agent-book-translate
pkgver=0.1.2
pkgrel=1
pkgdesc="A powerful LLM-driven agentic EPUB book translator with robust progress monitoring and recovery"
arch=("x86_64" "aarch64")
url="https://github.com/Xuepoo/agent-book-translate"
license=("MIT")
depends=("sqlite" "openssl")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Xuepoo/agent-book-translate/archive/v${pkgver}.tar.gz")
sha256sums=('04521cb5ab5757384d4ed936a802bc716792ca60842232c715af6e46b658d387')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  CARGO_PROFILE_RELEASE_LTO=true cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --lib
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
