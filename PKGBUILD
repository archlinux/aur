# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=1.0.4
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'libpanel' 'gtksourceview5' 'podman' 'vte4')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver".tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('9299fa0aa30ce50c0c0da850cdc66cebba832719b8bef8527200a2ee1db98d3e41d528fab82046269bd1aa25e4b6bbf282ed47d013ed7fa4d2687ecabda418b0')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
