# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=examine-git
pkgver=2.0.0.r21.gab61dfa
pkgrel=1
pkgdesc="A system information viewer for the COSMIC™ Desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-ext-orbit/cosmic-ext-examine"
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
provides=("${pkgname%-git}" 'cosmic-ext-examine')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-ext-orbit/cosmic-ext-examine.git')
sha256sums=('SKIP')

pkgver() {
  cd cosmic-ext-examine
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cosmic-ext-examine
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd cosmic-ext-examine
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  just build-release --frozen
}

package() {
  cd cosmic-ext-examine
  just rootdir="$pkgdir" install
}
