# Maintainer: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=mcumgrctl
pkgver=0.20.0
pkgrel=1
pkgdesc="Rust CLI for Zephyr MCUmgr (built from source)"
arch=('x86_64')
url="https://github.com/Finomnis/mcumgr-toolkit"
license=('MIT' 'Apache-2.0')
# btleplug (BLE) uses libdbus at runtime; gcc-libs for libgcc_s of the Rust binary
depends=('dbus' 'gcc-libs')
makedepends=('pkg-config' 'dbus')
conflicts=('mcumgrctl-bin')
options=('!debug')
# Rust is NOT a pacman dependency: it is managed via rustup outside of pacman.
# prepare() verifies that cargo/rustc are in PATH and fails with a clear error otherwise.
# NOTE: the upstream tag is "0.20.0" (no "v" prefix)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Finomnis/mcumgr-toolkit/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c7b29cb792eda9924cc4b810f9830b83b504f076a891252500e65ac99d8f385e')

_srcname="mcumgr-toolkit-${pkgver}"
_required_rust="1.89"  # rust-version of the workspace Cargo.toml

prepare() {
  if ! command -v cargo >/dev/null 2>&1 || ! command -v rustc >/dev/null 2>&1; then
    error "cargo/rustc not found in PATH. Rust is managed via rustup, not pacman."
    error "Install it before building:  https://rustup.rs  (e.g. 'curl --proto =https --tlsv1.2 -sSf https://sh.rustup.rs | sh')"
    return 1
  fi

  local current
  current="$(rustc --version | awk '{print $2}')"
  if [ "$(vercmp "$current" "$_required_rust")" -lt 0 ]; then
    warning "rustc $current is older than $_required_rust (project rust-version); the build may fail."
    warning "Update with: rustup update"
  fi

  msg "Using $(rustc --version) ($(cargo --version))"
}

build() {
  cd "${srcdir}/${_srcname}"
  cargo build --release --locked -p mcumgrctl
}

check() {
  cd "${srcdir}/${_srcname}"
  ./target/release/mcumgrctl --version
}

package() {
  cd "${srcdir}/${_srcname}"
  install -Dm755 target/release/mcumgrctl \
    "$pkgdir/usr/bin/mcumgrctl"
  install -Dm644 LICENSE-APACHE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
