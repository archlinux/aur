# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=libs76-hidpi-widget-git
pkgver=r14.6398f4b
pkgrel=1
pkgdesc="System76 HiDPI daemon widget library"
arch=('x86_64')
url="https://github.com/pop-os/hidpi-widget"
license=('GPL3')
depends=('gtk3' 'libhandy' 'system76-hidpi-daemon')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/hidpi-widget.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/hidpi-widget"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/hidpi-widget"
	cargo build --release
	cargo build --release --manifest-path ffi/Cargo.toml
	cargo run -p tools --bin pkgconfig -- \
		s76_hidpi_widget /usr/lib /usr/include
}

package() {
	cd "$srcdir/hidpi-widget"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
