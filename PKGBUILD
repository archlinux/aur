# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-tasks-git
pkgver=r78.2f3c6ff
pkgrel=1
pkgdesc="Task management app for the COSMIC desktop."
arch=('x86_64' 'aarch64')
url="https://tasks.edfloreshz.dev"
license=('GPL-3.0-or-later')
depends=('libsecret')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/edfloreshz/cosmic-tasks.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
