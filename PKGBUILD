# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=proto
pkgdesc='A multi-language version and dependency manager'
pkgver=0.17.0
pkgrel=1
license=('MIT')
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
makedepends=('cargo')
options=('!lto')
_sha='6085198087abfc03fa5b47f2890171c1d44ce773'
_short_sha="${_sha::7}"
source=("${pkgname}-${pkgver}-${_short_sha}.tar.gz::https://api.github.com/repos/moonrepo/proto/tarball/${_sha}")
sha256sums=('3fb510e6915c2fef06a8fe7919767f447e6f1c72cc11b2742b2f5b887ec6bb1c')

prepare() {
  cd "moonrepo-proto-${_short_sha}"
  export RUSTUP_TOOLCHAIN="stable"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "moonrepo-proto-${_short_sha}"
  export RUSTUP_TOOLCHAIN="stable"
  export CARGO_TARGET_DIR="target"
  cargo build --release --frozen

  mkdir -p completions
  "./target/release/${pkgname}" completions --shell bash >"completions/bash"
  "./target/release/${pkgname}" completions --shell zsh >"completions/zsh"
  "./target/release/${pkgname}" completions --shell fish >"completions/fish"
}

package() {
  cd "moonrepo-proto-${_short_sha}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
