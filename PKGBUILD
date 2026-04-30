# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="phylum"
pkgver=7.5.0
pkgrel=2
pkgdesc="Command line interface for the Phylum API"
arch=(
  'aarch64'
  'x86_64'
)
url="https://phylum.io"
_url="https://github.com/phylum-dev/cli"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'zlib'
)
makedepends=(
  'cargo'
  'git'
)
options=(
  '!lto'
)
_pkgsrc="${pkgname}-cli"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
)
b2sums=('7b0e27f7a36f7b94debb4fd9606c6c2d4f93bfe03d0e63cf4b8e08b5a2024785d6638a1b8623aab9270d0dc68935ba483cedc8a600600935e95509889af70228')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=false
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo fetch --locked --target host-tuple
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo build --frozen --release --all-features
  cargo run --package xtask gencomp
}

# check() {
#   _source

#   cd "${srcdir}/${_pkgsrc}"
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "target"
  install -vDm755 "release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "_${pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
