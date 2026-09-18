# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-osk-git
pkgver=r52.d7b66a2
pkgrel=1
pkgdesc="COSMIC On-Screen Keyboard"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-osk"
license=('GPL-3.0-only')
depends=(
  'cosmic-icons-git'
  'libxkbcommon'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-osk.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  # git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
