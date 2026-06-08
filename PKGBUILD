# Maintainer: Simone Camito <zibo.camito@gmail.com>

pkgname=ashell
pkgver=0.9.0
pkgrel=1
pkgdesc="A ready to go Wayland status bar for Hyprland and Niri"
url="https://github.com/MalpenZibo/${pkgname}"
license=("GPL-3.0-or-later")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
makedepends=(
  "cargo"
  "git"
  "wayland-protocols"
  "clang"
)
depends=(
  "libxkbcommon"
  "wayland"
  "dbus"
  "libpipewire"
  "libpulse"
)
arch=("x86_64")
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('5b7b921523facaf7b4dfcdc74afbff58747be1850fa585eb8d17532c740281f6178f87e00dcfce921a9db40ab75053037eb3cbe6701cf4fce46032eb89ab6008')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
