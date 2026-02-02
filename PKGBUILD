# Maintainer: Serge K <arch@phnx47.net>

pkgname=proto
pkgver=0.55.1
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
sha256sums=('00b4053527ed12be90077e949cc45ffcaeb5eeaf054fa84e773e5ff11e42d7ea')

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
