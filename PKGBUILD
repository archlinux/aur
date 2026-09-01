# Maintainer: Simone Camito <zibo.camito@gmail.com>

_pkgname=ashell
pkgname="${_pkgname}-git"
pkgver=r2144.175e229e
pkgrel=2
pkgdesc="A ready to go Wayland status bar for Hyprland and Niri"
_git="https://github.com/MalpenZibo/${_pkgname}.git"
url="${_git}"
license=("GPL-3.0-or-later")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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
source=(
  "${_pkgname}::git+${_git}"
  "${_pkgname}.service"
)
b2sums=(
  'SKIP'
  '380276439360cb311dc2bec4592b943c980ca6f4aa8f819d7929d63f6d6dcd053a0ef21545db91c91fce41c1f366ca81073050f6010b58c0b4d592bafb036c9e'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -Dm644 "${srcdir}/${_pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
