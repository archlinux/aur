# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=pods
pkgver=3.2.0
pkgrel=1
pkgdesc="Manage your containers"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'vte4'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'meson'
)
checkdepends=(
  'appstream-glib'
  'desktop-file-utils'
)
optdepends=(
  'docker: Docker container support'
  'podman: Podman container support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('231950d4971872e2667c3a333abd8d09b4002ef6a92b44b331ee98b054a80ffb')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
