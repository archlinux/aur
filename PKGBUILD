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
source=(
	'git+https://gitlab.com/asus-linux/asusctl.git'
	'git+https://github.com/flukejones/uhid-virt.git'
	'0001-Fix-reference-to-packed-field-is-unaligned.patch'
	'0001-cargo-patch-the-source-to-pull-a-patch.patch'
)
md5sums=(
	'SKIP'
	'SKIP'
	'6407424a4f9f698d51564fc4ecf45555'
	'e60fc2d845d1eb363c664ef20d15adbd'
)
_gitdir=${pkgname%"-git"}

pkgver() {
	cd "$srcdir/$_gitdir"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_gitdir"
	export RUSTUP_TOOLCHAIN=stable
	patch --directory="$srcdir/uhid-virt" --forward --strip=1 --input="${srcdir}/0001-Fix-reference-to-packed-field-is-unaligned.patch"
	patch --forward --strip=1 --input="${srcdir}/0001-cargo-patch-the-source-to-pull-a-patch.patch"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
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

