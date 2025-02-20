# newm - Wayland compositor
# Maintainer: L0Wigh <mathiotthomas@gmail.com>

_pkgname=newm-next
pkgname=newm-next-git
pkgver=r765.dd9097f
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
url="https://github.com/newm-next/newm-next"
source=(
	'git+https://github.com/newm-next/pywm-next'
	'git+https://github.com/newm-next/newm-next'
)
sha512sums=(
	'SKIP'
	'SKIP'
)
provides=('newm')
conflicts=('newm' 'newm-git' 'newm-atha-git')

pkgver() {
	cd "$srcdir/$_pkgname"
	( set -o pipefail
	git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
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
	cd "$srcdir"/pywm-next
	python3 setup.py install --root="$pkgdir" --optimize=1
	cd "$srcdir"/newm-next
	python3 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 "$srcdir/newm-next/newm/resources/newm.desktop" "$pkgdir/usr/share/wayland-sessions/newm.desktop"
}
