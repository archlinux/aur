# Maintainer: Serge K <arch@phnx47.net>

pkgname=moon
pkgver=2.2.6
pkgrel=1
pkgdesc='Task runner and repo management tool for the web ecosystem'
license=('MIT')
url="https://github.com/moonrepo/moon"
arch=('x86_64' 'aarch64')
depends=('gcc-libs' 'xz')
makedepends=('cargo' 'protobuf')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6f8a5deafb74a7bc3162e4546093969b8a9f98e424fc3baea0fa165729a31f2a')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  mkdir -p completions
}

build() {
  cd "${pkgname}-${pkgver}"
  export CFLAGS="${CFLAGS} -O0"
  cargo build --release --frozen

  "./target/release/${pkgname}" completions --shell bash >"completions/bash"
  "./target/release/${pkgname}" completions --shell zsh >"completions/zsh"
  "./target/release/${pkgname}" completions --shell fish >"completions/fish"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 755 "target/release/${pkgname}x" -t "${pkgdir}/usr/bin"

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
