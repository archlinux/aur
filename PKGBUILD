# Maintainer: <tera_1225 @ hotmail ðot com>

pkgname=libsignal-ffi
_pkgname=libsignal
pkgver=0.105.0
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

sha256sums=('7e4a30c300ed7fe92df22147e3de300f3d7bfc8d1eab1d3c4653e7bda10b0284')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
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
