# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xdg-desktop-portal-cosmic-git
pkgver=1.0.0.alpha.6.r3.ga515c19
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/xdg-desktop-portal-cosmic"
license=('GPL-3.0-only')
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
  'mold'
)
options=('!lto')
provides=("${pkgname%-git}" 'xdg-desktop-portal-impl')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  ARGS+=" --frozen" nice make
}

package() {
  cd "${pkgname%-git}"
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="$pkgdir" install
}
