# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.16.1
pkgrel=1
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64 armv7l armv7h)
groups=(wpe)
conflicts=(cog-git)
depends=('wpewebkit>=2.36.0' 'wpebackend-fdo>=1.10.0' libinput)
makedepends=(meson wayland-protocols libxcb libxkbcommon-x11 gtk4 weston)
optdepends=('libxcb: x11 platform support'
            'libxkbcommon-x11: x11 platform support'
			'gtk4: gtk4 platform support')
license=(custom:MIT)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz"
        "https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=(1489740db6b4ea568578035c30b8b2f4 SKIP)
sha1sums=(1235203085e7ccd8fc76eab6bdfcdb2e3ae38ea9 SKIP)
sha256sums=(37c5f14123b8dcf077839f6c60f0d721d2a91bb37829e796f420126e6b0d38b5 SKIP)

build () {
	rm -rf _build
	arch-meson \
		-D documentation=false \
		-D manpages=true \
		-D platforms=drm,gtk4,headless,wayland,x11 \
		-D programs=true \
		-D soup2=disabled \
		-D wayland_weston_content_protection=true \
		-D wayland_weston_direct_display=true \
		_build "${pkgname}-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir "${pkgdir}"

	install -Dm644 "${pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
