# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.12.1
pkgrel=1
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64 armv7l armv7h)
groups=(wpe)
conflicts=(cog-git)
depends=('wpewebkit>=2.30.0' 'wpebackend-fdo>=1.8.0' libinput)
makedepends=(cmake wayland-protocols libxcb libxkbcommon-x11 gtk4)
optdepends=('libxcb: x11 platform support'
            'libxkbcommon-x11: x11 platform support'
			'gtk4: gtk4 platform support')
license=(custom:MIT)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz"
        "https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=(25a80a5a8a52b8873933a128151b8928 SKIP)
sha1sums=(3b9f67bc23cd9e3db2221366d6cde4ca0b06b811 SKIP)
sha256sums=(23caaafa2ef5c2f6a97d467fcce908ea71087ad03b72deb9280225c0dd561c91 SKIP)

build () {
	cmake -H"${pkgname}-${pkgver}" -Bbuild \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DUSE_SOUP2=OFF \
		-DCOG_PLATFORM_WL=ON \
		-DCOG_PLATFORM_DRM=ON \
		-DCOG_PLATFORM_X11=ON \
		-DCOG_PLATFORM_GTK4=ON \
		-DCOG_PLATFORM_HEADLESS=ON \
		-DCOG_BUILD_PROGRAMS=ON \
		-DINSTALL_MAN_PAGES=ON \
		-DCOG_WESTON_DIRECT_DISPLAY=OFF  # Needs libweston-9-protocols
	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --build build --target install

	install -Dm644 "${pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
