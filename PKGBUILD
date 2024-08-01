# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tasks-git
pkgver=r105.27672ff
pkgrel=1
pkgdesc="A simple task management application for the COSMIC desktop."
arch=('x86_64' 'aarch64')
url="https://tasks.edfloreshz.dev"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'libxkbcommon')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-tasks-git' 'orderly-git')
source=('git+https://github.com/edfloreshz/tasks.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
