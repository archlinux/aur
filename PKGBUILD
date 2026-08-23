# Maintainer: LiamillionSS <liamillion-dev at protonmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-viewer-git
pkgver=r155.6c999eb
pkgrel=1
pkgdesc="An image viewer for the COSMIC desktop environment."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-viewer"
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
  'libheif'
  'libjpeg-turbo'
)
makedepends=(
  'cargo'
  'cmake'
  'desktop-file-utils'
  'git'
  'just'
  'mold'
  'libheif'
  'libjpeg-turbo'
  'nasm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-viewer.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
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
