# newm - Wayland compositor
# Maintainer: L0Wigh <mathiotthomas@gmail.com>

pkgname=newm-next-git-qs
pkgver=0.4.3
pkgrel=1
license=('MIT')
pkgdesc="newm-next Wayland compositor"
depends=(
	python3
	wayland
	libinput
	libxcb
	libxkbcommon
	opengl-driver
	pixman
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm
	seatd
	xorg-xwayland
	brightnessctl
	python-evdev
	python-numpy
	python-imageio

	python-cairo
	python-psutil
	python-pam
	python-pyfiglet
	python-thefuzz
	python-dasbus
)
makedepends=(
	git
	sed
	python3
	meson
	ninja
	wayland-protocols
	xorgproto
)
arch=('any')
url="https://github.com/SEKAMISehi/newm-next.git"
source=(
	'git+https://github.com/SEKAMISehi/pywm-next.git'
	'git+https://github.com/SEKAMISehi/newm-next.git'
)
sha512sums=(
	'SKIP'
	'SKIP'
)
provides=('newm')
conflicts=('newm' 'newm-git' 'newm-next-git' 'newm-atha-git')

pkgver() {
	echo "0.4.3"
}
prepare() {
	cd "$srcdir"/pywm-next
	git submodule init
	git submodule update --init --recursive
}
build() {
	cd "$srcdir"/pywm-next
	python3 setup.py build
	cd "$srcdir"/newm-next
	python3 setup.py build
}
package() {
	sudo pacman -S kitty brightnessctl

	cd "$srcdir"/pywm-next
	python3 setup.py install --root="$pkgdir" --optimize=1
	cd "$srcdir"/newm-next
	python3 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 "$srcdir/newm-next/newm/resources/newm.desktop" "$pkgdir/usr/share/wayland-sessions/newm.desktop"
}
