# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tasks-git
pkgver=0.2.0.r8.gfa665f5
pkgrel=1
pkgdesc="A simple task management application for the COSMIC desktop."
arch=('x86_64' 'aarch64')
url="https://tasks.edfloreshz.dev"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-tasks-git' 'orderly-git')
source=('git+https://github.com/cosmic-utils/tasks.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
