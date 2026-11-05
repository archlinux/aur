# Maintainer: agony <27015 at riseup dot net>

pkgname=ryl
pkgver=0.28.0
pkgrel=1
pkgdesc='Fast YAML linter and formatter'
arch=('x86_64' 'aarch64' 'armv7h' 'powerpc64le')
url='https://github.com/owenlamont/ryl'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e652e61f38e9d563764774ac6d2e9eff0bde5641a350deaa2a94c861ad85959')

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
