# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=resources-git
pkgver=r120.0e5d508
pkgrel=1
pkgdesc="Monitor your system resources and processes"
arch=('x86_64')
url="https://github.com/nokyan/resources"
license=('GPL3')
depends=('libadwaita')
makedepends=('cargo-nightly' 'git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/nokyan/resources.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  arch-meson "${pkgname%-git}" build
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
