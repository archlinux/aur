# Maintainer: Evert Vorster
#Contributor: Static_Rocket

pkgname=asusctl-devel-git
pkgver=6.3.8.r27.g9b4d535f
pkgrel=1
pkgdesc="Asus laptop control utilities"
arch=('x86_64')
url="https://github.com/OpenGamingCollective/asusctl"
license=('MPL-2.0')
depends=('libusb' 'udev' 'systemd' 'hicolor-icon-theme')
optdepends=(
	'libappindicator-gtk3: tray icon'
	'gtk3: control center ui'
)
makedepends=('git' 'cargo' 'clang' 'cmake' 'pango' 'gdk-pixbuf2' 'at-spi2-core' 'gtk3' 'sdl2' 'seatd' 'libinput')
provides=('asusctl' 'rog-control-center')
conflicts=('asusctl' 'rog-control-center')
source=('git+https://github.com/OpenGamingCollective/asusctl.git#branch=main')
md5sums=('SKIP')
_gitdir=${pkgname%"-devel-git"}

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

