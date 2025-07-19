# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=paleta
pkgver=0.3.1
pkgrel=3
pkgdesc="Extract the dominant colors from any image."
arch=('x86_64')
url="https://github.com/nate-xyz/paleta"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=(
  'cargo'
  'git'
  'meson'
)
checkdepends=('appstream-glib')
source=("git+https://github.com/nate-xyz/paleta.git#tag=v$pkgver")
sha256sums=('e4fd896fc1ab4112b8c26c5d24cb9a9262b10cb6c97551d84f6521bd1d19ca7c')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package () {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
