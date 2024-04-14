# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=pods
pkgver=2.0.1
pkgrel=2
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL-3.0-or-later')
depends=('gtksourceview5' 'libadwaita' 'libpanel' 'podman' 'vte4')
makedepends=('cargo' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9c55c8af8bb83acf90ab14749e3ed9935cbd21acdb6c0d1e9c809432af9d32b7')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
