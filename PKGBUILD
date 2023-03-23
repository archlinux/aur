# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=geopard
pkgver=1.4.0
pkgrel=1
pkgdesc="Colorful, adaptive gemini browser"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/Geopard"
license=('GPL3')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
_commit=9f9abcdd5d117ff808eb5d4cc22e06fd210c9d2c  # tags/v1.4.0^0
source=("git+https://github.com/ranfdev/Geopard.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Geopard"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/Geopard"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Geopard build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
