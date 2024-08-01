# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cosmic-applets-git
pkgver=r1048.1dbdba8
pkgrel=1
pkgdesc="WIP applets for COSMIC Panel"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-applets"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'cosmic-icons-git'
  'dbus'
  'libinput'
  'libpulse'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=('git+https://github.com/pop-os/cosmic-applets.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
