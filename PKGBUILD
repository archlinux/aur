# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-files-git
pkgver=1.0.0.alpha.1.r16.g8e8ea23
pkgrel=1
pkgdesc="File manager for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-files"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'glib2'
  'hicolor-icon-theme'
  'libxkbcommon'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-files.git')
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
  export CARGO_TARGET_DIR=target

  # use mold instead of lld to speed up build
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
