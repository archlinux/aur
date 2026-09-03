# Maintainer: falser <zhangjf@tongtech.com>
pkgname=omarchy-share-picker-git
_pkgname=omarchy-share-picker
pkgver=0.1.0.r8.g42fcd4a
pkgrel=1
pkgdesc="Share picker for xdg-desktop-portal-hyprland (screen, window, region)"
arch=('x86_64' 'aarch64')
url="https://github.com/falser101/omarchy-share-picker"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'grim'
  'hyprland'
  'slurp'
  'xdg-desktop-portal-hyprland'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
  'wayland'
)
provides=('omarchy-share-picker')
conflicts=('omarchy-share-picker')
source=("git+${url}.git")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${_pkgname}"
  local desc
  desc=$(git describe --long --tags --abbrev=7 2>/dev/null || true)
  if [[ -n $desc ]]; then
    printf '%s\n' "${desc#v}" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
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
  cargo build --frozen --release --bins
}

package() {
  cd "${_pkgname}"
  install -Dm755 target/release/omarchy-share-picker \
    "${pkgdir}/usr/bin/omarchy-share-picker"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
