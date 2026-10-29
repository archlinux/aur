# Maintainer: shbernal <shbernal.01@gmail.com>

pkgname=models
pkgver=0.14.1
pkgrel=1
pkgdesc='TUI and CLI for browsing AI models, benchmarks, coding agents and provider statuses'
arch=('x86_64' 'aarch64')
url='https://github.com/reyamira/models'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74361e3fde193772cd0db2ce4c9394487e437c4d7e416ebfafb0af661291d58a')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  local shell
  for shell in bash fish zsh; do
    target/release/models completions "${shell}" > "completions.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/models "${pkgdir}/usr/bin/models"
  install -Dm644 completions.bash "${pkgdir}/usr/share/bash-completion/completions/models"
  install -Dm644 completions.fish "${pkgdir}/usr/share/fish/vendor_completions.d/models.fish"
  install -Dm644 completions.zsh "${pkgdir}/usr/share/zsh/site-functions/_models"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
