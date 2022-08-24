# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.14.0
pkgrel=1
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64 armv7l armv7h)
groups=(wpe)
conflicts=(cog-git)
depends=('wpewebkit>=2.36.0' 'wpebackend-fdo>=1.10.0' libinput)
makedepends=(cmake wayland-protocols libxcb libxkbcommon-x11 gtk4 weston)
optdepends=('libxcb: x11 platform support'
            'libxkbcommon-x11: x11 platform support'
			'gtk4: gtk4 platform support')
license=(custom:MIT)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz"
        "https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=(2352aaba1a4ff31b1d1fb559c4941a01 SKIP)
sha1sums=(2da37ea6c25e45425aa80de4a129484ee226dd96 SKIP)
sha256sums=(e23936f1ce350ea5ea6fa0709b63d34776b05709388aed9c6cf3fdc41299de9f SKIP)

build () {
	CFLAGS="${CFLAGS} $(pkg-config libdrm --cflags)" \
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
		-DCOG_WESTON_DIRECT_DISPLAY=ON
	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --build build --target install

	install -Dm644 "${pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
