# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-settings-daemon-git
pkgver=r68.54700df
pkgrel=1
pkgdesc="Cosmic settings daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-settings-daemon"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'acpid'
  'adw-gtk3'
  'geoclue'
  'libinput'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'git'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-settings-daemon.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  make vendor

  sed -i 's|libexec|lib|g' Makefile src/main.rs
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice make prefix='/usr' VENDOR='1' all
}

package() {
  cd "${pkgname%-git}"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
