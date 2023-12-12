# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=2.0.0
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'libpanel' 'gtksourceview5' 'podman' 'vte4')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
b2sums=('d46763270b37ba5defae93442a49a6af1a0fc0ec838776b2794c8f308569b37c42d24548a129703d757e33d1951ed7a0c03cffc1c7ad0c3a8679e0c1ac8906b8')

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
