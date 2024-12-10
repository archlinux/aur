# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=simple-completion-language-server-git
pkgver=r132.7a6b5d6
pkgrel=1
pkgdesc="Allow to use common word completion and snippets for Helix editor"
url="https://github.com/estin/simple-completion-language-server"
license=("MIT")
arch=("any")
makedepends=(cargo)
source=("git+https://github.com/estin/simple-completion-language-server.git")
sha256sums=('SKIP')

_gitname="simple-completion-language-server"

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_gitname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_gitname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --offline --release
  #cargo install --path .
}

package() {
  cd $_gitname
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "target/release/${_gitname}" "$pkgdir/usr/bin/${_gitname}"
}
