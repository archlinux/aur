# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-player-git
pkgver=1.0.0.alpha.6.r5.g56678a4
pkgrel=1
pkgdesc="WIP COSMIC media player"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-player"
license=('GPL-3.0-only')
depends=(
  'gstreamer'
  'gst-plugins-good'
  'gst-plugins-base'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-player.git')
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
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
