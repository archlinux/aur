# Maintainer: éclairevoyant
# Contributor: Jasper van Bourgognie <louiecaulfield at gmail dot com>
# Contributor: Andreas Radke <andyrtr at archlinux dot org>

_pkgname=libinput
pkgname="$_pkgname-three-finger-drag"
pkgver=1.23.0
pkgrel=2
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/$_pkgname/"
arch=(x86_64)
license=(custom:X11)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(libevdev libwacom mtdev systemd)
# upstream doesn't recommend building docs
makedepends=(check git gtk4 meson wayland-protocols)
checkdepends=(python-pytest)
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
source=("git+https://gitlab.freedesktop.org/$_pkgname/$_pkgname.git?signed#tag=c76559bb72b7ba3f1d3c80b72c8f686a2990cdaa"
        0001-Three-finger-dragging-TFD-state-machine.patch
        0002-Cleanup.patch
        0003-TFD-add-debounce-state-for-touch-count-decrease.patch)
b2sums=('SKIP'
        '3eebc915aaccaec1a9164813ddea7b014a025baa7efff544700b48bb30d4fcd7827b871277b5b6ca0c3fde8b943fab2ccbc42f0f0d2da9b71a8c3f3c61a31765'
        '44eba06688dc591aaed4f9962a9bf8c14a8faa16a25d2e09c0f9c05cd29444f342edbf78e62f4eebfaca1a67c5ea63ce0bd9f0441e211d09c30cf1ef2d559cd9'
        'e3dd24b99ec9e7afeb0a328840bd240d2beb2cd1d01939320da32fa090418b716d84345e8be251c24f0e41278d535437a506bd6245848a83dfb05ee7dd9b5f14')
validpgpkeys=('772183A93E722C0CD301BE62872C444A692EF9A5') # José Expósito <jose.exposito89@gmail.com>

prepare() {
	cd $_pkgname
	patch -Np1 -i "$srcdir/0001-Three-finger-dragging-TFD-state-machine.patch"
	patch -Np1 -i "$srcdir/0002-Cleanup.patch"
	patch -Np1 -i "$srcdir/0003-TFD-add-debounce-state-for-touch-count-decrease.patch"
}

build() {
	arch-meson $_pkgname build \
		-D udev-dir=/usr/lib/udev \
		-D documentation=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -vDm644 $_pkgname/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
