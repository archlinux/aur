# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-settings-daemon-git
pkgver=r25.e87837e
pkgrel=1
pkgdesc="WIP COSMIC settings daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-settings-daemon"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=('systemd-libs')
makedepends=(
  'cargo'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-settings-daemon.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  make vendor
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  make prefix='/usr' VENDOR='1' all
}

package() {
  cd "${pkgname%-git}"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
