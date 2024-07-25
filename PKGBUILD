# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-store-git
pkgver=r252.fe4547b
pkgrel=1
pkgdesc="Cosmic App Store"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-store"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'archlinux-appstream-data'
  'cosmic-icons-git'
  'glib2'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'flatpak'
  'git'
  'just'
  'mold'
)
optdepends=(
  'flatpak: Flatpak packages support'
  'packagekit: package manager integration module'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-store.git')
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
