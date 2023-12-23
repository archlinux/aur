# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.18.2
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
md5sums=('7fbfc2e19304132be0d73f5e5512151c' 'SKIP')
sha1sums=('045294f7fa878db86e4b8a617ee4ac056a71cb75' 'SKIP')
sha256sums=('3c4237cff6323b8c3eaf52c6f3f6415b898a22c0127c6c396c1eaa6eef46c279' 'SKIP')

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
