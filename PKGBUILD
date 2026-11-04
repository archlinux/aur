# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname="tailor-hwcaps"
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI tool for checking Tuxedo hardware capabilites (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs/"
license=('GPL-2.0-or-later')
groups=('tuxedo-rs')
provides=(
  'tailor-hwcaps'
)
depends=(
  'glibc'
  'libgcc'
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
  "${pkgname}"::"git+${url}#tag=${_srcname}-v${pkgver}"
)
sha256sums=('50ceaa0040abfd515c7b2532f6969bb5b6392fb4dc71c6e63016e453a6294970')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${pkgname}"
  # Fetch packages
  cargo fetch -v --locked --target "${CARCH}-unknown-linux-gnu" --manifest-path "${_srcname}/Cargo.toml"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd ${pkgname}
  cargo build --frozen --release --all-features -p "${_srcname}"
}

package() {
  cd "${pkgname}"

  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${_srcname}"
}

# vim: sw=2 ts=2 et:
