# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.18.0
pkgrel=1
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64 armv7l armv7h)
groups=(wpe)
conflicts=(cog-git)
depends=('wpewebkit>=2.36.0' 'wpebackend-fdo>=1.10.0' libinput libmanette)
makedepends=(meson wayland-protocols libxcb libxkbcommon-x11 gtk4 weston)
optdepends=('libxcb: x11 platform support'
            'libxkbcommon-x11: x11 platform support'
			'gtk4: gtk4 platform support')
license=(custom:MIT)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz"
        "https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=('9521458c72322e1b2e39e8b1cca93d24' 'SKIP')
sha1sums=('73ec1684c31de7247ecbd5e852c16cf88416bedd' 'SKIP')
sha256sums=('410bf70f9aa3812db72d75c25cefee421efa0391ab03dc3c37299dfaa388f4fd' 'SKIP')

build () {
	rm -rf _build
	arch-meson \
		-D documentation=false \
		-D manpages=true \
		-D platforms=drm,gtk4,headless,wayland,x11 \
		-D programs=true \
		-D wayland_weston_content_protection=true \
		-D wayland_weston_direct_display=true \
		-D wpe_api=1.1 \
		_build "${pkgname}-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir "${pkgdir}"

	install -Dm644 "${pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
