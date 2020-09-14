# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.8.0
pkgrel=1
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64 armv7l armv7h)
groups=(wpe)
conflicts=(cog-git)
depends=('wpewebkit>=2.28.0' 'wpebackend-fdo>=1.6.0' libinput)
makedepends=(cmake wayland-protocols)
license=(custom:MIT)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz"
        "https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=(f7aa8a425927cab247563411fc67c5a3 SKIP)
sha1sums=(977559204dae0f9220e4c6b8ded7537899fd2daf SKIP)
sha256sums=(181b1f4963cdf264b8068460a64d14c92a627f7138ebecc0f36fce085f4e92dd SKIP)

build () {
	cmake -H"${pkgname}-${pkgver}" -Bbuild \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCOG_PLATFORM_FDO=ON \
		-DCOG_PLATFORM_DRM=ON \
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
