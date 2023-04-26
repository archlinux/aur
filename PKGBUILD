# Maintainer: Static_Rocket

pkgname=asusctl-git
pkgver=4.6.0.r26.gfdc7d88
pkgrel=1
pkgdesc="Asus laptop control utilities"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL2')
depends=('libusb' 'udev' 'systemd')
optdepends=(
	'acpi_call: fan control'
	'libappindicator-gtk3: tray icon'
	'gtk3: control center ui'
)
makedepends=('git' 'cargo' 'clang' 'cmake' 'pango' 'gdk-pixbuf2' 'at-spi2-core' 'gtk3')
provides=('asusctl')
conflicts=('asusctl')
source=('git+https://gitlab.com/asus-linux/asusctl.git')
md5sums=('SKIP')
_gitdir=${pkgname%"-git"}

pkgver() {
	cd "$srcdir/$_gitdir"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_gitdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_gitdir"
	export RUSTUP_TOOLCHAIN=stable
	make build
}

package() {
	cd "$srcdir/$_gitdir"
	export RUSTUP_TOOLCHAIN=stable
	make DESTDIR="$pkgdir" install
}

