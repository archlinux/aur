# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xdg-desktop-portal-cosmic-git
pkgver=r146.813352e
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/xdg-desktop-portal-cosmic"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'hicolor-icon-theme'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'wayland'
  'xdg-desktop-portal'
)
makedepends=(
  'cargo'
  'clang'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  make vendor
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  make prefix='/usr' libexecdir='/usr/lib' VENDOR='1' all
}

package() {
  cd "${pkgname%-git}"
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="$pkgdir" install
}
