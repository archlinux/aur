# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-hidpi-git
pkgver=0.10.0.r107.g61d6408f
pkgrel=1
license=(custom:MIT)
pkgdesc='Modular Wayland compositor library, with XWayland HiDPI'
url=https://github.com/swaywm/wlroots
arch=(x86_64)
provides=("wlroots-hidpi=${pkgver%%.r*}")
conflicts=(wlroots)
options=(debug)
depends=(libcap systemd wayland opengl-driver libxcb xcb-util-errors
         xcb-util-wm pixman libinput libxkbcommon)
makedepends=(meson ninja git wayland-protocols xorgproto)
source=("${pkgname}::git+${url}"
        "https://github.com/swaywm/wlroots/pull/2064.diff")
sha512sums=('SKIP'
            'SKIP')


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

	patch -Np1 -i ../2064.diff

	rm -rf build
	meson build \
		--prefix /usr \
		--buildtype debug \
		-Dlibcap=enabled \
		-Dlogind=enabled \
		-Dlogind-provider=systemd \
		-Dxcb-errors=enabled \
		-Dxcb-icccm=enabled \
		-Dxwayland=enabled \
		-Dx11-backend=enabled \
		-Dexamples=true
	ninja -C build
}

package () {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
