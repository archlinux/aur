# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-hidpi-git
pkgver=0.10.0.r147.g0758a4fc
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
        "xwayland_hidpi.diff::https://github.com/swaywm/wlroots/pull/2064.diff"
        # "xwayland_hidpi.diff::https://github.com/swaywm/wlroots/compare/master...MisterDA:xwayland_hidpi.diff"
       )
sha512sums=('SKIP'
            'c8f316ebffaf6ad0991afc0091c0a1dec69c29ec7a2e8c5c5cf260d9919e11b1040da9006028aac5e1883fb788927c4bccef05629bf3db2b3c2374e33c6482f2'
            # 'febd12baefd79a3563fd66931e4f79f3f80b1261b396fffd07b84cc527ff036346eb7ccf73b0e1aed5d3ea51ca39c8420af82966d75cce02367654324b52e050'
           )

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

	patch -Np1 -i ../xwayland_hidpi.diff

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
