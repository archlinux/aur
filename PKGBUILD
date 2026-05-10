# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="mcman"
pkgver=0.4.5
pkgrel=2
pkgdesc="Powerful Minecraft Server Manager CLI. Docker and git support included."
arch=(
  'x86_64'
)
url="https://github.com/deniz-blue/${pkgname}"
license=(
  'GPL-3.0-or-later'
)
makedepends=(
  'cargo'
)
depends=(
  'bzip2'
  'glibc'
  'libgcc'
)
optdepends=(
  'docker: for docker support'
  'git: for git support'
)
options=(
  '!lto'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('6081fe57b122e7551b25a95edb137ddd14411f5bd635ce7c74c676d7534da3c869b08b831a0c5f6fd6588b399fdf48403ad2a3ea6d41220e12d3726bcf5ec9a9')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
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
}

check() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  cargo test --frozen --all-features
}

package() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${CARGO_TARGET_DIR}/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
