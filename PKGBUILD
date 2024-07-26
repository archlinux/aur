# Maintainer: Mark Wagie <mark at proton dot me>
# Co-Maintainer: soloturn <soloturn@gmail.com>
pkgname=cosmic-edit-git
pkgver=r457.33d6522
pkgrel=1
pkgdesc="Text editor for the COSMIC desktop"
arch=('x86_64')
url="https://github.com/pop-os/cosmic-edit"
license=('GPL-3.0-or-later')
depends=(
  'cosmic-icons-git'
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-text-editor')
options=('!lto')
source=('git+https://github.com/pop-os/cosmic-edit.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
