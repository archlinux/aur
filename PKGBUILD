# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="nodtool"
pkgver=1.4.4
pkgrel=2
pkgdesc="CLI tool for reading GameCube and Wii disc images"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/encounter/nod"
license=(
  'MIT OR Apache-2.0'
)
depends=(
  'glibc'
  'libgcc'  
)
makedepends=(
  'cargo'
  'git'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('77a0b2b28bc69c804875bd035f47c33eb21425c7c175bea88670cc300861e151')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  # export ZSTD_SYS_USE_PKG_CONFIG=1
  export CFLAGS+=" -ffat-lto-objects"
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
  install -vDm644 "LICENSE"*  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
