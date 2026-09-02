# Maintainer: falser <zhangjf@tongtech.com>
pkgname=xdg-desktop-portal-omarchy-git
_pkgname=xdg-desktop-portal-omarchy
pkgver=0.1.0.r16.g047a8c4
pkgrel=1
pkgdesc="XDG Desktop Portal backend for Omarchy (Hyprland)"
arch=('x86_64' 'aarch64')
url="https://github.com/falser101/xdg-desktop-portal-omarchy"
license=('MIT')
depends=(
  'xdg-desktop-portal'
  'xdg-desktop-portal-hyprland'
  'grim'
  'hyprland'
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
  'wayland'
)
optdepends=(
  'omarchy: Omarchy shell UI for portal dialogs (recommended)'
)
provides=('xdg-desktop-portal-omarchy' 'xdg-desktop-portal-impl')
conflicts=('xdg-desktop-portal-omarchy')
source=("git+${url}.git")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${_pkgname}"
  local desc
  # git describe prints nothing useful without tags; an empty pipe must not
  # win over the fallback (sed succeeds on empty stdin).
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
  DESTDIR="${pkgdir}" PREFIX=/usr ./scripts/install-system.sh --skip-build
}
