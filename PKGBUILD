# newm - Wayland compositor
# Maintainer: oldNo.7 <oldNo.7@archlinux.org>

pkgname=newm-atha-git
pkgver=r739.cacafde.r567.f61b027
pkgrel=1
license=('MIT')
pkgdesc="Wayland compositor"
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
url="https://git.sr.ht/~atha/newm-atha"
source=(
	'git+https://git.sr.ht/~atha/pywm-atha'
	'git+https://git.sr.ht/~atha/newm-atha'
	'dmabuf-capture.patch'
)
sha512sums=(
	'SKIP'
	'SKIP'
	'dd0d1d52a36c2ff7541f866e3cc11281762115a839d94f157a64189eab63211d085f48b36d795ce65e91b5cb937e1eea09bb1ed36f0d8845979c0fabe8b67adc'
)
provides=('newm')
conflicts=('newm' 'newm-git')

pkgver() {
	cd "$srcdir"/newm-atha
	newm_v=$(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
	cd "$srcdir"/pywm-atha
	pywm_v=$(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
	echo "$newm_v.$pywm_v"
}
prepare() {
	cd "$srcdir"/pywm-atha
	git submodule init
	git submodule update --init --recursive
	patch subprojects/wlroots/examples/dmabuf-capture.c "$srcdir"/dmabuf-capture.patch
}
build() {
	cd "$srcdir"/pywm-atha
	python3 setup.py build
	cd "$srcdir"/newm-atha
	python3 setup.py build
}
package() {
	cd "$srcdir"/pywm-atha
	python3 setup.py install --root="$pkgdir" --optimize=1
	cd "$srcdir"/newm-atha
	python3 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 "$srcdir/newm-atha/newm/resources/newm.desktop" "$pkgdir/usr/share/wayland-sessions/newm.desktop"
}
