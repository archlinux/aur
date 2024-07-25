# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-greeter-git
pkgver=r124.acc30ac
pkgrel=1
pkgdesc="libcosmic greeter for greetd, which can be run inside cosmic-comp"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-greeter"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'cosmic-comp-git'
  'greetd'
  'libxkbcommon'
  'pam'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'git-lfs'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-greeter.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just vendor

  git lfs install --local
  git remote add network-origin https://github.com/pop-os/cosmic-greeter
  git lfs fetch network-origin
  git lfs checkout
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
