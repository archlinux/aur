# Maintainer: agony <27015 at riseup dot net>

pkgname=ryl
pkgver=0.30.0
pkgrel=1
pkgdesc='Fast YAML linter and formatter'
arch=('x86_64' 'aarch64' 'armv7h' 'powerpc64le')
url='https://github.com/owenlamont/ryl'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6c005e39d0952dec7b937a0e9efb27a381979621a880ae6dee29777a641a94af')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  for shell in bash fish zsh; do
    target/release/ryl --generate-completions "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  [[ "$(target/release/ryl --version)" == "ryl ${pkgver}" ]]
  printf 'key: value\n' | target/release/ryl check --enable trailing-spaces,key-duplicates --no-cache -
  [[ "$(printf 'key:   value\n' | target/release/ryl format --no-cache -)" == 'key: value' ]]
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/ryl -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/ryl"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ryl.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_ryl"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 crates/ryl-yaml-parser/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/ryl-yaml-parser"
  install -Dm644 crates/ryl-yaml-parser/.licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}/ryl-yaml-parser/.licenses"
}
