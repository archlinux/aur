# Maintainer: shbernal <shbernal.01@gmail.com>

_pkgname=models
pkgname=${_pkgname}-git
pkgver=0.14.1.r1575.g416a823
pkgrel=1
pkgdesc='TUI and CLI for browsing AI models, benchmarks, coding agents and provider statuses'
arch=('x86_64' 'aarch64')
url='https://github.com/reyamira/models'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!lto')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  local shell
  for shell in bash fish zsh; do
    target/release/models completions "${shell}" > "completions.${shell}"
  done
}

check() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  # Asserts a model count band that upstream's data refreshes outgrow
  cargo test --frozen -- --skip test_committed_aa_json_deserializes_and_helpers_match
}

package() {
  cd "${_pkgname}"

  install -Dm755 target/release/models "${pkgdir}/usr/bin/models"
  install -Dm644 completions.bash "${pkgdir}/usr/share/bash-completion/completions/models"
  install -Dm644 completions.fish "${pkgdir}/usr/share/fish/vendor_completions.d/models.fish"
  install -Dm644 completions.zsh "${pkgdir}/usr/share/zsh/site-functions/_models"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
