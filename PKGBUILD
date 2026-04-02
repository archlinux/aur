# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=phpantom-git
pkgver=r642.e476f7f
pkgrel=1
pkgdesc="A fast, lightweight PHP language server written in Rust."
provides=('phpantom')
conflicts=('phpantom')
url="https://github.com/AJenbo/phpantom_lsp"
license=("MIT")
arch=("any")
makedepends=('git' 'cargo')
source=("git+https://github.com/AJenbo/phpantom_lsp.git")
sha256sums=('SKIP')

_gitname="phpantom_lsp"

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/${_gitname}"
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${_gitname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "target/release/${_gitname}" "$pkgdir/usr/bin/${_gitname}"
}
