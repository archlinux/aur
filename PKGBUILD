# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="phylum"
pkgver=7.1.1
pkgrel=1
pkgdesc="Command line interface for the Phylum API"
arch=('x86_64' 'aarch64')
url="https://phylum.io"
_url="https://github.com/phylum-dev/cli"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('cargo')
_pkgsrc="cli-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('501bc1bacba75f16778d4a0fd1c69dd1f88a095514717c0fc98dea74d4902ca117181cbd926149fd78fd5de7fe1905c41bdb0d5a251a5fe0e9162e9a09b2ddcd')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  cargo run --package xtask gencomp
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "target"
  install -Dm755 "release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  cd "completions"
  install -Dm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "_${pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
