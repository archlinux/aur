# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname='llm-sessions'
pkgver=0.4.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='TUI explorer for LLM coding-agent sessions'
url='https://gitlab.com/wykwit/llm-sessions'
license=('MIT')
makedepends=('cargo' 'rust')
depends=('git')
options=(!lto)
arch=('x86_64' 'i686')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('e72ab8b40a666b1b6bc404133a8438781f926cb615da6a36b86fda89b0446482')

prepare() {
  cd "${pkgname}-${_pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${_pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

package() {
  cd "${pkgname}-${_pkgver}"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./LICENSE
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./README.md
}
