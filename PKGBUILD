# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-files-git
pkgver=r443.82580d5
pkgrel=1
pkgdesc="File manager for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-files"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=('glib2' 'hicolor-icon-theme' 'libxkbcommon' 'xdg-utils')
makedepends=('cargo' 'git' 'just' 'mold')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-files.git')
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
