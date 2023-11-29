# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname="tailor-hwcaps"
pkgver="0.2.1"
pkgrel=1
pkgdesc="CLI tool for checking Tuxedo hardware capabilites (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs/"
license=('GPL2')
groups=('tuxedo-rs')
provides=(
  'tailor-hwcaps'
)
depends=(
  'glibc'
  'gcc-libs'
  'tuxedo-io'
  'tuxedo-keyboard'
)
makedepends=(
  'git'
  'cargo'
)
optdepends=(
  'tailord: Daemon for controlling the listed HW capabilities'
)

# Upstream it is "tailor_hwcaps"
_srcname="tailor_hwcaps"
source=(
  "${pkgname}-${pkgver}.tar.gz"::${url}/archive/refs/tags/"${_srcname}-v${pkgver}.tar.gz"
)
sha256sums=(
  '7672f3c597b49113e6f9a2495b065109c9f74d7dd47beab866ef0c0605e7a311'
)

# Arhive format is:
_archive="tuxedo-rs-${_srcname}-v${pkgver}"

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_archive}"
  # Fetch packages
  cargo fetch -v --locked --target "${CARCH}-unknown-linux-gnu" --manifest-path "${_srcname}/Cargo.toml"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd ${_archive}
  cargo build --frozen --release --all-features -p "${_srcname}"
}

package() {
  cd "${_archive}"

  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${_srcname}"
}

# vim: sw=2 ts=2 et:
