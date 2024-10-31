# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="phylum"
pkgver=7.1.3
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
b2sums=('c72168c3de838ee7ba25c701055a292b8dccc79179f48ea335d8f99e32b3e66e1b3560cbd4c5ca954cab8d7a1b62447d76e92ff2f167f47ce60e906776d73f24')

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
