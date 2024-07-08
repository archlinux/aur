# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: soloturn <soloturn@gmail.com>
pkgname=cosmic-notifications-git
pkgver=r75.34f44eb
pkgrel=1
pkgdesc="Layer Shell notifications daemon which integrates with COSMIC."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-notifications"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'intltool'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-notifications.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  # Use mold linker instead of lld
  sed -i 's/lld/mold/g' justfile

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  # use nice to build with lower priority
  nice just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
