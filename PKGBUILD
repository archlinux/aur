# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xdg-desktop-portal-cosmic-git
pkgver=r106.0ca1863
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/xdg-desktop-portal-cosmic"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'hicolor-icon-theme'
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  make vendor

  # libexec > lib
  sed -i 's|libexecdir = $(prefix)/libexec|libexecdir = $(libdir)|g' Makefile
}

build() {
  cd "${pkgname%-git}"
  make prefix='/usr' VENDOR='1' all
}

package() {
  cd "${pkgname%-git}"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
