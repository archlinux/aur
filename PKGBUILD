# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=tailord
pkgver="0.2.4"
pkgrel=1
pkgdesc="Daemon handling fan, keyboard and general HW support for Tuxedo laptops (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs"
license=('GPL2')
groups=('tuxedo-rs')
provides=(
  'tailord'
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
  'tailor-cli: CLI for controlling the daemon'
  'tailor-gui: GUI for controlling the daemon'
  'tailor-hwcaps: CLI tool for checking hardware capabilities'
)
conflicts=(
  'tuxedo-control-center'
)

source=(
  "${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgname}-v${pkgver}.tar.gz"
)
sha256sums=(
  'ee7da526b30044a1b06ae168a7335b48d18bc5bfb8a008c00550216c7dd6a81c'
)

# Extracted archive uses the format:
_archive="tuxedo-rs-${pkgname}-v${pkgver}"

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_archive}"

  # Fixup systemd service for tailord
  sed -e 's|ExecStart=.*|ExecStart=/usr/bin/tailord|' "${pkgname}/tailord.service.in" > "${pkgname}/tailord.service"

  # Fetch packages
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu" --manifest-path "${pkgname}/Cargo.toml"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${_archive}"
  cargo build --frozen --release --all-features --manifest-path "${pkgname}/Cargo.toml"
}

package() {
  cd "${_archive}"
  
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/dbus-1/system.d/" "${pkgname}/com.tux.Tailor.conf"
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system" "${pkgname}/tailord.service"
}

# vim: sw=2 ts=2 et:
