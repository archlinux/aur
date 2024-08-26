# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.9.0
_version=(${pkgver//./ })
_minver="${_version[0]}.${_version[1]}"
_maxver="${_version[0]}.$((_version[1] + 1))"
pkgrel=1
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=("wayfire>=${_minver}" "wayfire<${_maxver}" "wf-shell>=${_minver}" "wf-shell<${_maxver}" gtkmm3 wdisplays)
optdepends=('wdisplays: display configuration tool')
makedepends=(wayland-protocols meson ninja glm)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('8c8605ccb720fb24e58f16c2e2727cd07b6754bd441c9a3f0e715548b4e7c4ae')
b2sums=('7f068dda1c256d930db57d8cd299652416c5a2357742e1cc3adddab98b143ff33219dcde7c94f951d456d8a4047ce606fd95ddf1a9b4b33f8e1de8997b67aeb5')

build ()
{
	rm -rf build
	PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
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
