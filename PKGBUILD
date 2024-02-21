# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-greeter-git
pkgver=r66.8fb7b9b
pkgrel=1
pkgdesc="WIP libcosmic greeter for greetd, which can be run inside cosmic-comp"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-greeter"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=(
#  'cosmic-comp-git'
  'greetd'
  'libxkbcommon'
  'pam'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-greeter.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
