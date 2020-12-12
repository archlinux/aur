# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wlroots-hidpi-git
pkgver=0.12.0.r96.g4c363a56
pkgrel=1
license=(custom:MIT)
pkgdesc='Modular Wayland compositor library, with XWayland HiDPI'
url=https://github.com/swaywm/wlroots
arch=(x86_64)
provides=("wlroots-hidpi=${pkgver%%.r*}")
conflicts=(wlroots)
options=(debug)
depends=(systemd wayland opengl-driver libxcb xcb-util-errors
         xcb-util-wm pixman libinput libxkbcommon)
makedepends=(meson ninja git wayland-protocols xorgproto)
source=("${pkgname}::git+${url}"
        # "xwayland_hidpi.diff::https://github.com/swaywm/wlroots/pull/2064.diff"
        "xwayland_hidpi.diff::https://github.com/swaywm/wlroots/compare/master...MisterDA:xwayland_hidpi.diff"
       )
sha512sums=('SKIP'
            # 'c8f316ebffaf6ad0991afc0091c0a1dec69c29ec7a2e8c5c5cf260d9919e11b1040da9006028aac5e1883fb788927c4bccef05629bf3db2b3c2374e33c6482f2'
            'a7c501760020f1ca3082fa17e5efd2fcfb5c41f957d1a23e902b253cc1fe68a99452cd1949843aa30acb25f52810fc1f30146517050dfeb72eff1ba98b21cca4'
           )

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "${pkgname}"
	patch --forward --strip=1 --input="${srcdir}/xwayland_hidpi.diff"
}

build () {
	cd "${pkgname}"

	rm -rf build
	meson build \
		--prefix /usr \
		--buildtype debug \
		-Dlogind=enabled \
		-Dlogind-provider=systemd \
		-Dxcb-errors=enabled \
		-Dxcb-icccm=enabled \
		-Dxwayland=enabled \
		-Dx11-backend=enabled \
		-Dexamples=false
	ninja -C build
}

package () {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
