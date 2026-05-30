# Maintainer: Xuepoo Foter <foter@example.com>
pkgname=agent-book-translate
pkgver=0.1.6
pkgrel=1
pkgdesc="A powerful LLM-driven agentic EPUB book translator with robust progress monitoring and recovery"
arch=("x86_64" "aarch64")
url="https://github.com/Xuepoo/agent-book-translate"
license=("MIT")
depends=("sqlite" "openssl")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Xuepoo/agent-book-translate/archive/v${pkgver}.tar.gz")
sha256sums=('e071466d7674aec0e245120cc3eadadd174def513f2c5ad3c903ac088c2a8ff8')

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
