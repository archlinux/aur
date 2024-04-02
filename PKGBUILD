# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=tailord
pkgver="0.2.5"
pkgrel=1
pkgdesc="Daemon handling fan, keyboard and general HW support for Tuxedo laptops (part of tuxedo-rs)"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs"
license=('GPL-2.0-or-later')
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
  "${pkgname}"::"git+${url}#tag=${pkgname}-v${pkgver}"
)
sha256sums=(
  'cf33972732601cd9e0f2502689a2f7620ba5fc886174e84f9192bbd5c8e801a1'
)

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${pkgname}"

  # Fixup systemd service for tailord
  sed -e 's|ExecStart=.*|ExecStart=/usr/bin/tailord|' "${pkgname}/tailord.service.in" > "${pkgname}/tailord.service"

  # Fetch packages
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu" --manifest-path "${pkgname}/Cargo.toml"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${pkgname}"
  cargo build --frozen --release --all-features --manifest-path "${pkgname}/Cargo.toml"
}

package() {
  cd "${pkgname}"
  
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/dbus-1/system.d/" "${pkgname}/com.tux.Tailor.conf"
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system" "${pkgname}/tailord.service"
}

# vim: sw=2 ts=2 et:
