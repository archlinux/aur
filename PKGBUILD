# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.10.0
_version=(${pkgver//./ })
_minver="${_version[0]}.${_version[1]}"
_maxver="${_version[0]}.$((_version[1] + 1))"
pkgrel=2
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=("wayfire>=${_minver}" "wayfire<${_maxver}" "wf-shell>=${_minver}" "wf-shell<${_maxver}" gtkmm3 wdisplays)
optdepends=('wdisplays: display configuration tool')
makedepends=(wayland-protocols meson ninja glm)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('38b912dcaaf52f7585414b5b40a694b0706ed5570e17703bc3d07654646ba707')
b2sums=('0e0cce03651b2d87d410ca6e5bfe56b56f81dbd04f6c477e3813ff3587c87d14ff5369997dc8cb91cd7e9fd8dfc2cd435b4917b2b594f44c63a431d2625a08b8')

build ()
{
	rm -rf build
	arch-meson "${pkgname}-${pkgver}" build \
		--auto-features=disabled \
		-Dwf_shell=enabled
	meson compile -C build
}

check () {
	meson test -C build
}

package ()
{
	meson install -C build --destdir "$pkgdir"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}
