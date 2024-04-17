# Maintainer: <tera_1225 @ hotmail ðot com>

pkgname=libsignal-ffi
_pkgname=libsignal
pkgver=0.44.0
pkgrel=1
pkgdesc='Library for the Signal Protocol (ffi component)'
url="https://github.com/signalapp/${_pkgname}/tree/main/rust/bridge/ffi"
depends=('gcc-libs')
checkdepends=('cargo')
makedepends=(
  'cargo'
  'protobuf'
  'cmake'
  'clang'
  'git' # else have boringssl error
        # see https://github.com/signalapp/libsignal/issues/549
)
options=(!lto)
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('ef5bb03e2ebf37aefb31eb7c2e6c5196d07ca90f056e834a580f6293505789cd56268296a4ebc44b60b7550f2d6995ff1d8e4d27e73e783dedc29d097135d784')

prepare() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export RUST_BACKTRACE=full
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build -p libsignal-ffi --profile=release
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/"
  install -Dm644 "target/release/libsignal_ffi.a" "${pkgdir}/usr/lib/"
}
