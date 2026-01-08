# Maintainer: Simone Camito <zibo.camito@gmail.com>

pkgname=ashell
pkgver=0.7.0
pkgrel=2
pkgdesc="A ready to go Wayland status bar for Hyprland and Niri"
url="https://github.com/MalpenZibo/${pkgname}"
license=("MIT")
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('600cd7b783cd628c890aae0689bbdd2562bfd24d57af2a7c2d60dbc2b30315708dae9bfa22639f516511e9880eafd7f8b117b2c73944d9f19f7e067a8e28b9be')

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
