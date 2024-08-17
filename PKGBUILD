# Maintainer: <tera_1225 @ hotmail ðot com>

pkgname=libsignal-ffi
_pkgname=libsignal
pkgver=0.55.0
_message_backups_tests_hash="216bbb5e58afe0577c3bb7d732458c4d2a6477c5"
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
  "Signal-Message-Backup-Tests-${_message_backups_tests_hash}.zip::https://github.com/signalapp/Signal-Message-Backup-Tests/archive/${_message_backups_tests_hash}.zip"
)

sha256sums=('ad7c5d305b6cdb9108efa037303bfb73465e90c073ec8de95a9b3a6934bd8660'
            '410938965db4cd3b4e66bb335eb4bdda46dc0f8a871a1bd558dfea9a7f970b2a')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p "rust/message-backup/tests/res/"
  rm -R "rust/message-backup/tests/res/Signal-Message-Backup-Tests"
  ln -s "${srcdir}/Signal-Message-Backup-Tests-${_message_backups_tests_hash}" "rust/message-backup/tests/res/Signal-Message-Backup-Tests"
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
