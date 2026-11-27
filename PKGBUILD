# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-forecast-git
pkgver=r190.86b44fa
pkgrel=1
pkgdesc="Weather app written in rust and libcosmic"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-ext-orbit/cosmic-ext-forecast"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
  'openssl'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-ext-orbit/cosmic-ext-forecast.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  export OPENSSL_NO_VENDOR=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
