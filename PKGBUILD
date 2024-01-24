# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=proto
pkgdesc='Pluggable multi-language version manager'
_sha='9bfad0b22c97131d64ce8647938355b5aab9ffb6'
_short_sha="${_sha::7}"
pkgver=0.29.1
pkgrel=1
arch=('x86_64')
_gh_owner='moonrepo'
_gh_repo='proto'
url="https://github.com/${_gh_owner}/${_gh_repo}"
license=('MIT')
depends=('git' 'gcc-libs' 'xz')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}-${_short_sha}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}")
sha256sums=('7a34d9dc7795c007302773d3ca964f1ce045d59133233e68aa169bae6652a9ee')

prepare() {
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"
  export RUSTUP_TOOLCHAIN="stable"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"
  export RUSTUP_TOOLCHAIN="stable"
  export CARGO_TARGET_DIR="target"
  cargo build --release --frozen

  mkdir -p completions
  "./target/release/${pkgname}" completions --shell bash >"completions/bash"
  "./target/release/${pkgname}" completions --shell zsh >"completions/zsh"
  "./target/release/${pkgname}" completions --shell fish >"completions/fish"
}

package() {
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm 644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
