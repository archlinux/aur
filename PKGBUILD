# Maintainer: <tera_1225 @ hotmail ðot com>

pkgname=libsignal-ffi
_pkgname=libsignal
pkgver=0.45.1
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

sha512sums=('40f1535e22ff12ede374e815007311dffd0ca8da486d5b4733b6add1fac9d6ab3903981995c20479537c4409ae79feea736d6fa1267443056906619368308d04')

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
