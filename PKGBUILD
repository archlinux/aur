# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=ddgpt
pkgname=${_pkgname}-git
pkgver=r12.ed530d1
pkgrel=1
pkgdesc='A CLI client for duckduckgo various AI-Chatbots'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/MMunier/ddgpt"
license=('MIT')
makedepends=('cargo' 'git')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=($_pkgname::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd ${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}
check() {
  cd ${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd ${_pkgname}
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
