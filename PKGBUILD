# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.18.5
pkgrel=1
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64 armv7l armv7h)
groups=(wpe)
conflicts=(cog-git)
depends=('wpewebkit>=2.42.5-3' 'wpebackend-fdo>=1.10.0' libinput libmanette)
makedepends=(meson wayland-protocols libxcb libxkbcommon-x11 gtk4 weston)
optdepends=('libxcb: x11 platform support'
            'libxkbcommon-x11: x11 platform support'
			'gtk4: gtk4 platform support')
license=(MIT)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.lz"
        "https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.lz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')

md5sums=('dbb4c8ae790615f435f6045b0a006be6'
         'SKIP')
sha1sums=('ee60f4278ca7876073b298492d2c9a8a4d03eb0e'
          'SKIP')
sha256sums=('d740c2d70b315bf364978f73b4116e3b8ad3dbd6bceafeeac71de51388658d21'
            'SKIP')

build () {
	rm -rf _build
	arch-meson \
		-D documentation=false \
		-D manpages=true \
		-D platforms=drm,gtk4,headless,wayland,x11 \
		-D programs=true \
		-D wayland_weston_content_protection=true \
		-D wayland_weston_direct_display=true \
		-D wpe_api=2.0 \
		_build "${pkgname}-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir "${pkgdir}"

	install -Dm644 "${pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
