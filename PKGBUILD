# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=moon
pkgdesc='Task runner and repo management tool for the web ecosystem'
pkgver=1.16.4
pkgrel=1
license=('MIT')
_gh_owner='moonrepo'
_gh_repo='moon'
url="https://github.com/${_gh_owner}/${_gh_repo}"
arch=('x86_64' 'aarch64')
depends=('gcc-libs' 'xz')
makedepends=('cargo')
options=('!lto')
_sha='fc45a546bf35933bdf85bdb9bbe677d74519dabf'
_short_sha="${_sha::7}"
source=("${pkgname}-${pkgver}-${_short_sha}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}")
sha256sums=('c6047c1db3b58a4db437446e278b416f4f1182bb6042cfac851f6ba15af5b5ee')

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
