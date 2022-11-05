# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=geopard
pkgver=1.3.0+10+g8481743
pkgrel=1
pkgdesc="Colorful, adaptive gemini browser"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/Geopard"
license=('GPL3')
depends=('libadwaita' 'python-gobject')
makedepends=('blueprint-compiler' 'cargo' 'git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
_commit=848174316d39bee3aec2fb156757bf49a0de6499
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
