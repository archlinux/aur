# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-clipboard-manager-git
pkgver=r58.c909342
pkgrel=1
pkgdesc="Clipboard manager for COSMIC"
arch=('x86_64')
url="https://github.com/wiiznokes/clipboard-manager"
license=('MIT')
depends=('cosmic-applets')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wiiznokes/clipboard-manager.git')
sha256sums=('SKIP')

pkgver() {
  cd clipboard-manager
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd clipboard-manager
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd clipboard-manager
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just build-release
}

package() {
  cd clipboard-manager
  just rootdir="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
