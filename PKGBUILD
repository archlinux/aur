# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=goup-rs
pkgver=0.14.0
pkgrel=1
_patch=""
pkgdesc='an elegant Go version manager write in rust'
arch=('x86_64' 'aarch64')
url='https://github.com/thinkgos/goup-rs'
license=('Apache-2.0')
makedepends=('cargo' 'git')
provides=("${pkgname%-rs}")
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('9875a7849ceb7e02459cf5552fafc628b39a61c8447121e3fdd1d1661b48afd23aa41d8d2ead304ce280dbf340cac017b1ab8b6439950476e240993b85463989')
options=(!debug !lto)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  # binary
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname%-rs}"
  # shell completions
  "./target/release/${pkgname%-rs}" completion bash > "./${pkgname%-rs}"
  "./target/release/${pkgname%-rs}" completion zsh > "./_${pkgname%-rs}"
  "./target/release/${pkgname%-rs}" completion fish > "./${pkgname%-rs}.fish"
  install -Dm0644 -t "${pkgdir}/usr/share/bash-completion/completions" "./${pkgname%-rs}"
  install -Dm0644 -t "${pkgdir}/usr/share/zsh/site-functions" "./${pkgname%-rs}"
  install -Dm0644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" "./${pkgname%-rs}.fish"
  # license
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
