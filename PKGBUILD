# Maintainer: Simone Camito <zibo.camito@gmail.com>

_pkgname=ashell
pkgname="${_pkgname}"
pkgver=0.1.0
pkgrel=2
pkgdesc="A ready to go Wayland status bar for Hyprland"
_git="https://github.com/MalpenZibo/${_pkgname}.git"
url="${_git}"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}-git")
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
source=(${_pkgname}::git+${_git})
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --tags --abbrev=0
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

package() {
  cd "${_pkgname}"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
