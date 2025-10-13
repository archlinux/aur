# Maintainer: Evert Vorster
#Contributor: Static_Rocket

pkgname=asusctl-devel-git
pkgver=6.1.14.r7.g360e841
pkgrel=1
pkgdesc="Asus laptop control utilities"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL2')
depends=('libusb' 'udev' 'systemd')
optdepends=(
	'libappindicator-gtk3: tray icon'
	'gtk3: control center ui'
)
makedepends=('git' 'cargo' 'clang' 'cmake' 'pango' 'gdk-pixbuf2' 'at-spi2-core' 'gtk3' 'sdl2' 'seatd' 'libinput')
provides=('asusctl' 'rog-control-center')
conflicts=('asusctl' 'rog-control-center')
source=('git+https://gitlab.com/asus-linux/asusctl.git#branch=devel')
md5sums=('SKIP')
_gitdir=${pkgname%"-devel-git"}

pkgver() {
	cd "$srcdir/$_gitdir"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_gitdir"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_gitdir"
	export RUSTUP_TOOLCHAIN=nightly
	make build
}

package() {
	cd "$srcdir/$_gitdir"
	export RUSTUP_TOOLCHAIN=nightly
	make DESTDIR="$pkgdir" install
}

