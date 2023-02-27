# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
pkgname=paleta
pkgver=0.3.1
pkgrel=1
pkgdesc="Extract the dominant colors from any image."
arch=('x86_64')
url="https://github.com/nate-xyz/paleta"
license=('GPL3')
depends=('libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
options=('!lto')
_commit=d779d2a0393d790586c3f73fb230d029ae406391  # tags/v0.3.1^0
source=("git+https://github.com/nate-xyz/paleta.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package () {
  meson install -C build --destdir "$pkgdir"
}
