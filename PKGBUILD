# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-tasks-git
pkgver=0.4.2.r0.g121ae5f
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
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  'cosmic-tasks-git'
  'orderly-git'
  'tasks-git'
)
source=('git+https://github.com/cosmic-ext-orbit/cosmic-ext-tasks.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  # cargo fetch --locked --target host-tuple
  cargo fetch --target host-tuple

  sed -i 's/--locked/--frozen/g' justfile
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  just build-release
}

check() {
  cd "${pkgname%-git}"
  appstreamcli validate --no-net resources/app.metainfo.xml
  desktop-file-validate resources/app.desktop
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
