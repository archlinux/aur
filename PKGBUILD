# Maintainer: éclairevoyant
# Contributor: Jasper van Bourgognie <louiecaulfield at gmail dot com>
# Contributor: Andreas Radke <andyrtr at archlinux dot org>

_pkgname=libinput
pkgname="$_pkgname-three-finger-drag"
pkgver=1.26.1
pkgrel=1
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
source=("git+https://gitlab.freedesktop.org/$_pkgname/$_pkgname.git?signed#tag=$pkgver"
        0001-Three-finger-dragging-TFD-state-machine.patch
		0002-Cleanup.patch
		0003-TFD-add-debounce-state-for-touch-count-decrease.patch
		0004-Take-hold-gestures-and-clickpad-state-into-account.patch
		0005-Debounce-for-4-fingers-before-drag-starts.patch
		0006-Cancel-hold-gestures-instead-of-finishing-them.patch
		0007-Abort-TFD-within-50-ms-on-detection-of-4-fingers.patch)
b2sums=('SKIP'
		'66ac7b434bb04a45ee43fa56cdd2d730c0952e9155298c7eae6694b2665f0e3faaf4a146c55f97c44a48a4d094522e9de763746153a74f985a620cb6755fdd31'
		'1ee9b3d1858d03121accfc88ffea78aa933c44ce13e0242a544408607291085ab68ef178a004211a1332a472dbc1e7ec4cb84e96584a6e865c0b1caff15a6d23'
		'622d00125811281aed2c0f3edbd258e268b861e10c50b806b5c3dc37f7a7bec1115d23d6290e6c91d2e857624797b1e2d0ffb902ecc285dc2fc6ef828459bcdb'
		'f20b1100a877731a37ecb3c81ad8fd3cec33a19fbab5e97ab91d67e600cc3a24a14de318c6f52f1230c2ed4430b3853e4f0536ce1319b17e43f06a16084538d4'
		'a84fbc8db9fa1cf4cdfc1f56f3f5b5b56f269ec39f91b759b5b18d5816a090937be590ddb7fb22d910b56dcbcda40a16bc5ca99dd5d32e2a4b0aba5189f6e6ff'
		'94b9d1c3242b52723741807edad280a38a1c481c44e2006c9d9e44d25304bcbaf76e9683a463b534a0caaef6ec94f4cb174644ff07e045523934025a4506c0e6'
		'dbd064cf3ab9c8f2bef213d09831fbe05645f9a2af7507eab28ba44177195d5a5c5fa61316e765c7b153cf2e228b613294d9d455d94d9b78f3ecc89e314fa656')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
	cd $_pkgname
	patch -Np1 -i "$srcdir/0001-Three-finger-dragging-TFD-state-machine.patch"
	patch -Np1 -i "$srcdir/0002-Cleanup.patch"
	patch -Np1 -i "$srcdir/0003-TFD-add-debounce-state-for-touch-count-decrease.patch"
	patch -Np1 -i "$srcdir/0004-Take-hold-gestures-and-clickpad-state-into-account.patch"
	patch -Np1 -i "$srcdir/0005-Debounce-for-4-fingers-before-drag-starts.patch"
	patch -Np1 -i "$srcdir/0006-Cancel-hold-gestures-instead-of-finishing-them.patch"
	patch -Np1 -i "$srcdir/0007-Abort-TFD-within-50-ms-on-detection-of-4-fingers.patch"
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
