# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mission-center
pkgver=0.5.0
pkgrel=1
pkgdesc="Monitor your CPU, Memory, Disk, Network and GPU usage"
arch=('x86_64')
url="https://gitlab.com/mission-center-devs/mission-center"
license=('GPL-3.0-or-later')
depends=('dmidecode' 'libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream-glib')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c943a2b3e639cc216e876efeeacc038815ecfbb1561a0278e74d4338d191a978')

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
