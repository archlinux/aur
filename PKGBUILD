# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-forecast-git
pkgver=r73.75e6cf9
pkgrel=1
pkgdesc="Weather app written in rust and libcosmic"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/forecast"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'libxkbcommon' 'openssl')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-utils/forecast.git')
sha256sums=('SKIP')

pkgver() {
  cd forecast
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd forecast
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd forecast
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd forecast
  just rootdir="$pkgdir" install
}
