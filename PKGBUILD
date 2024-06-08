# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mission-center
pkgver=0.5.1
pkgrel=1
pkgdesc="Monitor your CPU, Memory, Disk, Network and GPU usage"
arch=('x86_64')
url="https://gitlab.com/mission-center-devs/mission-center"
license=('GPL-3.0-or-later')
depends=('dmidecode' 'libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream-glib')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('8b020ac4f5927cbc52f1567824f60018776b843a399ebf6e8696b01c67c1ad18')

prepare() {
  cd "$pkgname-v$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
