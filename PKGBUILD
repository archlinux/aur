# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=libs76-hidpi-widget-git
pkgver=r17.a66eb84
pkgrel=1
pkgdesc="System76 HiDPI daemon widget library"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/hidpi-widget"
license=('GPL3')
depends=('gtk3' 'libhandy')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/hidpi-widget.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/hidpi-widget"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/hidpi-widget"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/hidpi-widget"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
  cargo build --release --manifest-path ffi/Cargo.toml
  cargo run -p tools --bin pkgconfig -- \
    s76_hidpi_widget /usr/lib /usr/include
}

package() {
  cd "$srcdir/hidpi-widget"
  make prefix=/usr DESTDIR="$pkgdir/" install
}
