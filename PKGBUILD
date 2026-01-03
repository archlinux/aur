# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=overskride
pkgver=0.6.6
pkgrel=1
pkgdesc='A simple yet powerful bluetooth client'
url="https://github.com/kaii-lb/overskride"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('bluez' 'libadwaita' 'libpulse')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e94fcabaed97dcc2ea17267eba90e6f157a069371306c9e28d6e8908505cada3')

prepare() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
