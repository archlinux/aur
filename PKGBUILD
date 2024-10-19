# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-calculator-git
pkgver=r46.046bec0
pkgrel=1
pkgdesc="Calculator for the COSMIC desktop."
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/calculator"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
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
source=('git+https://github.com/cosmic-utils/calculator.git')
sha256sums=('SKIP')

pkgver() {
  cd calculator
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd calculator
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd calculator
  export RUSTUP_TOOLCHAIN=stable
  export CC=clang
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd calculator
  just rootdir="$pkgdir" install
}
