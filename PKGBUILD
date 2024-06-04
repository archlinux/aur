# Maintainer: Serge K <arch@phnx47.net>

pkgname=moon
pkgdesc='Task runner and repo management tool for the web ecosystem'
pkgver=1.25.2
pkgrel=1
license=('MIT')
_gh_owner='moonrepo'
_gh_repo='moon'
url="https://github.com/${_gh_owner}/${_gh_repo}"
arch=('x86_64' 'aarch64')
depends=('gcc-libs' 'xz')
makedepends=('cargo')
options=('!lto')
_sha='a025876e41f042d630ce11ba511661fa7c579d8d'
_short_sha="${_sha::7}"
source=("${pkgname}-${pkgver}-${_short_sha}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}")
sha256sums=('cf3c6a6bc74f14b6e5e0d8704db13f684c6a5d10a6e34725ac1ef321cd25e979')

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
