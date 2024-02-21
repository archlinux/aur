# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-workspaces-git
pkgver=r161.7e81c9c
pkgrel=1
pkgdesc="WIP COSMIC Workspaces"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-workspaces-epoch"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'libinput'
  'libxkbcommon'
  'mesa'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-workspaces-epoch.git')
sha256sums=('SKIP')

pkgver() {
  cd cosmic-workspaces-epoch
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd cosmic-workspaces-epoch
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  make vendor
}

build() {
  cd cosmic-workspaces-epoch
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  make prefix='/usr' VENDOR='1' all
}

package() {
  cd cosmic-workspaces-epoch
  make prefix='/usr' DESTDIR="$pkgdir" install
}
