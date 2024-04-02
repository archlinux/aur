# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=tailor-cli
pkgver="0.3.1"
pkgrel=1
pkgdesc="CLI for controlling tailor-daemon (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs"
license=('GPL-2.0-or-later')
groups=('tuxedo-rs')
provides=(
  'tailor-cli' # Name conflict with 'tailor'
)
depends=(
  'glibc'
  'gcc-libs'
  'tailord=0.2.5'
)
makedepends=(
  'git'
  'cargo'
)
source=(
  "${pkgname}"::"git+${url}#tag=${pkgname%-*}-v${pkgver}"
)
sha256sums=(
  'cf33972732601cd9e0f2502689a2f7620ba5fc886174e84f9192bbd5c8e801a1'
)
# Source name is tailor_cli rather than tailor-cli
_srcname="tailor_cli"

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${pkgname}"
  # Fetch packages
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu" --manifest-path "${_srcname}/Cargo.toml"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${pkgname}"
  cargo build --frozen --release --all-features --manifest-path "${_srcname}/Cargo.toml"
}

package() {
  cd "${pkgname}"

  # Install it as tailor_cli following same convention as tailor_gui upstream
  # tailor is already taken by another package in AUR
  install -Dm0755 "target/release/tailor" "${pkgdir}/usr/bin/${_srcname}"
}

# vim: sw=2 ts=2 et:
