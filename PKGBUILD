# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-workspaces-git
pkgver=r225.2de3669
pkgrel=1
pkgdesc="Cosmic workspaces"
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
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-workspaces-epoch.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}-epoch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}-epoch"
  export RUSTUP_TOOLCHAIN=stable
  make vendor
}

build() {
  cd "${pkgname%-git}-epoch"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice make prefix='/usr' VENDOR='1' all
}

package() {
  cd "${pkgname%-git}-epoch"
  make prefix='/usr' DESTDIR="$pkgdir" install
}
