# Maintainer: Philip Meholm <mephim+dbuddy-aur@gmail.com>

pkgname=d-buddy-git
_pkgname=d-buddy
pkgver=0.1.1.r20.gfa6925e
pkgrel=1
pkgdesc="A simple TUI for browsing D-Bus messages, built with Rust and Ratatui."
arch=('x86_64' 'aarch64')
url="https://github.com/withholm/d-buddy"
license=('BSD 3')
depends=()
optdepends=(
    'xclip: for clipboard support on X11'
    'xsel: for clipboard support on X11'
    'wl-clipboard: for clipboard support on Wayland'
)
makedepends=('cargo' 'git')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd "$_pkgname"
  cargo_ver=$(grep -m1 '^version' Cargo.toml | sed 's/version\s*=\s*"\(.*\)"/\1/')
  printf "%s.r%s.%s" "$cargo_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
