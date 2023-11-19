# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgbase=tuxedo-rs
pkgname=(
  'tuxedo-rs'
  #'tailor-cli'
  #'tailord'
)
pkgver="0.2.3"
pkgrel=2
pkgdesc="Rust libraries for interacting with hardware from TUXEDO Computers"
arch=("x86_64")
url="https://github.com/AaronErhardt/tuxedo-rs"
license=('GPL2')
groups=('tuxedo-rs')
provides=(
  #'tailor_cli' # Name conflict with 'tailor'
  #'tailord'
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
_commit_hash="74b863e" # v0.2.3
source=(
  "${pkgbase}-${pkgver}"::"git+${url}#commit=${_commit_hash}"
)
sha256sums=(
  'SKIP'
)
_archive="${pkgbase}-${pkgver}"

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_archive}"
  # Mute warning about workspace resolver
  #echo 'resolver = "2"' >> Cargo.toml

  # Fixup systemd service for tailord
  #sed -e 's|ExecStart=.*|ExecStart=/usr/bin/tailord|' "tailord/tailord.service.in" > "tailord/tailord.service"

  # Fetch packages
  #cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${_archive}"
  #cargo build --frozen --release --all-features --workspace
}

package_tailor-cli() {
  local _srcname="tailor"
  pkgdesc="CLI for controlling tailor-daemon (part of tuxedo-rs)"
  provides=(
    'tailor_cli'
  )
  depends=(
    'glibc'
    'gcc-libs'
    'tailord'
  )
  cd "${_archive}"

  # Install it as tailor_cli following same convention as tailor_gui upstream
  # tailor is already taken by another package
  install -Dm0755 "target/release/${_srcname}" "${pkgdir}/usr/bin/${_srcname}_cli"
}

package_tailord() {
  pkgdesc="Daemon handling fan, keyboard and general HW support for Tuxedo laptops (part of tuxedo-rs)"
  depends+=()
  provides=(
    'tailord'
  )
  conflicts=(
    'tuxedo-control-center'
  )
  optdepends=(
    'tailor: CLI for controlling the daemon'
    'tailor-gui: GUI for controlling the daemon'
  )
  cd "${_archive}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/dbus-1/system.d/" "${pkgname}/com.tux.Tailor.conf"
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "${pkgname}/tailord.service"
}

package_tuxedo-rs() {
  echo "This package is not in use; to be merged"
}

# vim: sw=2 ts=2 et:
