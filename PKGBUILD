# Maintainer: Simone Camito <zibo.camito@gmail.com>

_pkgname=ashell
pkgname="${_pkgname}-git"
pkgver=9fe29c9
pkgrel=1
pkgdesc="A ready to go Wayland status bar for Hyprland"
_git="https://github.com/MalpenZibo/${_pkgname}.git"
url="${_git}"
license=("MIT")
makedepends=("cargo" "git" "wayland-protocols" "clang")
depends=(
  "libxkbcommon"
  "wayland"
  "dbus"
  "libpipewire"
  "libpulse"
)
arch=("x86_64")
source=(${_pkgname}::git+${_git})
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git rev-parse --short HEAD
}

prepare() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${_pkgname}"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
