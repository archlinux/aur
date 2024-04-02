# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-comp-git
pkgver=r996.3da08ed
pkgrel=1
pkgdesc="Compositor for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-comp"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'fontconfig'
  'libseat.so'
  'libinput'
  'libxcb'
  'libxkbcommon'
  'mesa'
  'systemd-libs'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/cosmic-comp/config.ron')
source=('git+https://github.com/pop-os/cosmic-comp.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  make vendor
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  make VENDOR='1' all
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install

  # Keybinding config
  # https://github.com/pop-os/cosmic-epoch#cosmic-comp
  install -Dm644 config.ron -t "$pkgdir/etc/cosmic-comp/"
}
