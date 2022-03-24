# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.12.3
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
md5sums=(320d01d8546144fba2e14bed3522c8c7 SKIP)
sha1sums=(8e28b216bb2462325a1df1e8e03ac199487440b0 SKIP)
sha256sums=(f464065057373c0430f6267205d1ab3367b54ac04d15b6b5531683b03212f45f SKIP)

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
