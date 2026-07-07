# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=pods
pkgver=3.1.0
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
checkdepends=('appstream-glib')
optdepends=(
  'docker: Docker container support'
  'podman: Podman container support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('10902a08804ed03680e5e5f070937b7f0b5b296107a3441485858d79766c73b3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  CFLAGS+=" -ffat-lto-objects"
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
