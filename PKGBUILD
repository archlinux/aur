# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=rnote-git
pkgver=0.5.18.r41.g60810c25
pkgrel=1
pkgdesc="A simple drawing application to create handwritten notes"
arch=('x86_64')
url="https://github.com/flxzt/rnote"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita' 'poppler-glib' 'gstreamer' 'alsa-lib')
makedepends=('meson' 'cargo' 'cmake' 'clang' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
b2sums=('SKIP')
options=('!lto')

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
