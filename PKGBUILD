# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=goup-rs
pkgver=0.14.1
pkgrel=1
_patch=""
pkgdesc='an elegant Go version manager write in rust'
arch=('x86_64' 'aarch64')
url='https://github.com/thinkgos/goup-rs'
license=('Apache-2.0')
makedepends=('cargo' 'git')
provides=('go' "${pkgname%-rs}")
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('cf003f85ac92a5c9eb3f0c4212759a8278e6cc88e3d4cf8b9d4354ca4144fe14ee092fa057bf9fed8396877dbad6fcff1f904fbcac5085cb326f0423fe2bd47a')
options=(!debug !lto)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --features no-self-update --frozen --release
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
