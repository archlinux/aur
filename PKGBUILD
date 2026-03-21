# Maintainer: futpib-bot
pkgname=tdctl-git
pkgver=r27.b268d3e
pkgrel=1
pkgdesc="CLI client for futpib's tdesktop Unix socket API"
arch=('x86_64')
url="https://github.com/futpib/tdctl"
license=('MIT')
depends=()
makedepends=('rustup' 'git')
provides=('tdctl')
conflicts=('tdctl')
source=("git+https://github.com/futpib/tdctl.git")
sha256sums=('SKIP')

pkgver() {
  cd tdctl
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd tdctl
  rustup toolchain install nightly --profile minimal --no-self-update
  rustup override set nightly
  cargo fetch --locked --target "$(rustc +nightly -vV | sed -n 's/host: //p')"
}

build() {
  cd tdctl
  cargo +nightly build --release --locked
}

package() {
  cd tdctl
  install -Dm755 target/release/tdctl "$pkgdir/usr/bin/tdctl"
  install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
