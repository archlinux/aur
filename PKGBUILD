# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=game-of-life
pkgver=0.3.2
pkgrel=1
pkgdesc="A simulator of Conway's game of life"
arch=('x86_64' 'aarch64')
url="https://github.com/sixpounder/game-of-life"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('ce0e2b8951c6d169c3e18bdfb465a7bdc6c841b52301379d85f9db24b786f3cca841990809fa55e191cd68342e570bb27cc55cb045c53ab70ee1f8b5cd9fb5c8')

prepare() {
  cd "$pkgname-${pkgver//_/-}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  local meson_options=(
    --buildtype release
  )

  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-${pkgver//_/-}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
