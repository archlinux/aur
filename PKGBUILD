# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-tweaks-git
pkgver=0.1.3.r68.g3d212df
pkgrel=1
pkgdesc="A tweaking tool for the COSMIC desktop."
arch=('x86_64')
url="https://github.com/cosmic-utils/tweaks"
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
conflicts=("${pkgname%-git}" 'cosmic-tweaks-git')
source=('git+https://github.com/cosmic-utils/tweaks.git')
sha256sums=('SKIP')

pkgver() {
  cd tweaks
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd tweaks
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd tweaks
  export RUSTUP_TOOLCHAIN=stable
  export CC=clang
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd tweaks
  just rootdir="$pkgdir" install
}
