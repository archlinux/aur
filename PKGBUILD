# Maintainer: Serge K <arch@phnx47.net>

pkgname=proto
pkgver=0.54.1
pkgrel=1
pkgdesc='Pluggable multi-language version manager'
arch=('x86_64' 'aarch64')
url='https://github.com/moonrepo/proto'
license=('MIT')
depends=('gcc-libs' 'git' 'unzip' 'gzip' 'xz')
optdepends=('rustup: support for Rust toolchains')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('95a0f7dc5b5ebd021a59d8845c0b7c9e082482cd8204c9d7ebe80a510c437e34')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  mkdir -p completions
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
  "./target/release/${pkgname}" completions --shell bash >"completions/bash"
  "./target/release/${pkgname}" completions --shell zsh >"completions/zsh"
  "./target/release/${pkgname}" completions --shell fish >"completions/fish"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 755 "target/release/${pkgname}-shim" "${pkgdir}/usr/bin/${pkgname}-shim"

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
