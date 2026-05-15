# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-panel-git
pkgver=1.0.13.r1.g256c65d
pkgrel=1
pkgdesc="XDG Shell Wrapper Panel for COSMIC"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-panel"
license=('GPL-3.0-only')
depends=(
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
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-panel.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
