# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='wlroots-git'
pkgver=0.8.1.r11.g17242619
pkgrel=1
license=('custom:MIT')
pkgdesc='Modular Wayland compositor library'
url='https://github.com/swaywm/wlroots'
arch=('x86_64')
provides=("wlroots=${pkgver%%.r*}")
conflicts=('wlroots')
options=('debug' '!strip')
depends=('libcap' 'systemd' 'wayland' 'opengl-driver' 'libxcb'
         'xcb-util-errors' 'xcb-util-image' 'xcb-util-wm' 'pixman'
         'libinput' 'libxkbcommon' 'libpng' 'ffmpeg' 'freerdp')
makedepends=('meson' 'ninja' 'git' 'wayland-protocols')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')


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
