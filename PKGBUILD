# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=orderly-git
pkgver=r89.6c1e7e2
pkgrel=1
pkgdesc="A simple task management application for the COSMIC desktop."
arch=('x86_64' 'aarch64')
url="https://tasks.edfloreshz.dev"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'libxkbcommon')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-tasks-git')
source=('git+https://github.com/edfloreshz/orderly.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
