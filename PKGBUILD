# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.8.0
pkgrel=5
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=("wayfire>=${pkgver%.*}" "wayfire<0.9" "wf-shell>=${pkgver%.*}" "wf-shell<0.9" gtkmm3 wdisplays)
makedepends=(wayland-protocols meson ninja glm)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
b2sums=('4d845edc631bda6b3fbee181d64897b366f4e73af7fef0e912f0a5dc9c7db4dc731319b6c25ce3e2206cc05c908ee402e01ed914cba4ccc63b0d52b9980b7414')

build ()
{
	rm -rf build
	PKG_CONFIG_PATH=/usr/lib/wlroots0.16/pkgconfig \
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Dwf_shell=enabled \
		-Denable_wdisplays=false
	ninja -C build
}

check () {
	meson test -C build
}

package ()
{
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}
