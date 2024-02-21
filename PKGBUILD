# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-osd-git
pkgver=r63.bc35c94
pkgrel=2
pkgdesc="WIP COSMIC OSD"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-osd"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'libxkbcommon'
  'systemd-libs'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/pop-os/cosmic-osd.git')
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

  # # libexec > lib
  sed -i 's|libexec|lib|g' Makefile
  sed -i 's|libexec|lib/polkit-1|g' src/subscriptions/polkit_agent_helper.rs
}

build() {
  cd "${pkgname%-git}"
  make prefix='/usr' VENDOR='1' all
}

package() {
  cd "${pkgname%-git}"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
