# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clipboard-manager-git
pkgver=0.1.0.r96.g0713b86
pkgrel=1
pkgdesc="Clipboard manager for COSMIC™"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-ext-orbit/clipboard-manager"
license=('GPL-3.0-or-later')
depends=(
  'cosmic-applets'
  'sqlite'
)
makedepends=(
  'cargo'
  'git'
  'git-lfs'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-clipboard-manager-git')
source=('git+https://github.com/cosmic-ext-orbit/clipboard-manager.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git lfs install --local
  git remote add network-origin https://github.com/cosmic-ext-orbit/clipboard-manager
  git lfs fetch network-origin
  git lfs checkout

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
