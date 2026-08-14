# Maintainer: vsk11-12
pkgname=wg-ratatui-tui-git
_pkgname=wg-ratatui-tui
pkgver=r7.0992ce2
pkgrel=1
pkgdesc="A WireGuard TUI interface built with Ratatui"
arch=('x86_64' 'aarch64')
url="https://github.com/vsk11-12/wg-ratatui-tui"
license=('MIT') # Change if your repo uses GPL-3.0, Apache-2.0, etc.
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --release --frozen
}

check() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo test --frozen
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  
  # Installs license if a LICENSE file exists in the repository
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE* 2>/dev/null || true
}
