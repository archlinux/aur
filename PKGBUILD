# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='wlroots-git'
pkgver=r2339.7efd9885
pkgrel=2
license=('custom:MIT')
pkgdesc='Modular Wayland compositor library'
url='https://github.com/swaywm/wlroots'
arch=('x86_64')
provides=('wlroots')
conflicts=('wlroots')
depends=('libcap' 'systemd' 'wayland' 'opengl-driver' 'libxcb'
         'xcb-util-errors' 'xcb-util-image' 'xcb-util-wm' 'pixman'
         'libinput' 'libxkbcommon')
makedepends=('meson' 'ninja')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')


pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	rm -rf build
	meson build \
		--prefix /usr \
		-Denable-libcap=true \
		-Denable-systemd=true \
		-Denable-elogind=false \
		-Denable-xcb_errors=true \
		-Denable-xwayland=true \
		-Denable-x11_backend=true
	ninja -C build
}

package () {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
