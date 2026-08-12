# Maintainer: Lennard Kittner <lennard@kittner.dev>
_sourceName="HyperHeadset"

pkgname="hyperheadset-git"
pkgver=1.10.0.r0.g1ecb979
pkgrel=2
pkgdesc="A CLI and tray application for monitoring and managing HyperX headsets."
arch=('x86_64')
url="https://github.com/LennardKittner/HyperHeadset"
license=('MIT')
install=${pkgname}.install
depends=(
  dbus
  systemd-libs
)
makedepends=(
  git
  cargo
)
source=(
    "git+${url}.git#branch=main"
)
sha256sums=('SKIP')
validpgpkeys=()
provides=("hyperheadset")
conflicts=("hyperheadset" "hyperheadset-bin")

pkgver() {
  cd "${_sourceName}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_sourceName}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_sourceName}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    cargo build --frozen --release --bin hyper_headset --bin hyper_headset_cli
}

check() {
    cd "${_sourceName}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
  cd "${_sourceName}"
  find target/release \
      -maxdepth 1 \
      -executable \
      -type f \
      -exec install -Dm0755 -t "${pkgdir}/usr/bin/" {} +

  install -Dm644 99-HyperHeadset.rules "${pkgdir}/usr/lib/udev/rules.d/99-HyperHeadset.rules"

  install -Dm644 hyper-headset.desktop "${pkgdir}/usr/share/applications/hyper-headset.desktop"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
