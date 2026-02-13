# Maintainer: Lennard Kittner <lennard@kittner.dev>
_tag=0ff337bcd9c21f304f1fa11356a342ee0a4543b8
_sourceName="HyperHeadset"

pkgname="hyperheadset-git"
pkgver=1.3.0
pkgrel=1
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
source=("git+${url}.git#tag=${_tag}")
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
  cd "${_sourceName}"
  git describe --tags | sed 's/^v//'
}

prepare() {
    cd "${_sourceName}"
    export RUSTUP_TOOLCHAIN=stable
    git submodule update --init --recursive
    cargo fetch --locked
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

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
