# Program Maintainer: Aashish Thapa <https://github.com/aashish-thapa>
# AUR Maintainer: justanoobcoder <syaorancode@gmail.com>

pkgname=wlctl-git
_pkgname=wlctl
pkgver=r159.7b3935d
pkgrel=1
pkgdesc="TUI for managing WiFi using NetworkManager (a fork of impala)"
arch=("any")
url="https://github.com/aashish-thapa/wlctl"
depends=("networkmanager")
makedepends=("git" "cargo")
license=("GPL-3.0")
conflicts=("$_pkgname-bin")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${_pkgname}"
  cargo build --release --frozen
}

check() {
  cd "${_pkgname}"
  cargo test --frozen
}

package() {
  cd "${_pkgname}"
  install -Dm 755 "target/release/$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 Readme.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
