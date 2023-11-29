# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=tailor-cli
pkgver="0.3.0"
pkgrel=1
pkgdesc="CLI for controlling tailor-daemon (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs"
license=('GPL2')
groups=('tuxedo-rs')
provides=(
  'tailor-cli' # Name conflict with 'tailor'
)
depends=(
  'glibc'
  'gcc-libs'
  'tailord'
)
makedepends=(
  'git'
  'cargo'
)

source=(
  "${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgname%-*}-v${pkgver}.tar.gz"
)
sha256sums=(
  '3529ccdccbca908212eb410f8a84fd6692bc54fd4407a327cfbbe14d696b569d'
)

# Extracted archive uses the format:
_archive="tuxedo-rs-${pkgname%-*}-v${pkgver}"
# Source name is tailor_cli rather than tailor-cli
_srcname="tailor_cli"

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_archive}"
  # Fetch packages
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu" --manifest-path "${_srcname}/Cargo.toml"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${_archive}"
  cargo build --frozen --release --all-features --manifest-path "${_srcname}/Cargo.toml"
}

package() {
  cd "${_archive}"

  # Install it as tailor_cli following same convention as tailor_gui upstream
  # tailor is already taken by another package in AUR
  install -Dm0755 "target/release/tailor" "${pkgdir}/usr/bin/${_srcname}"
}

# vim: sw=2 ts=2 et:
