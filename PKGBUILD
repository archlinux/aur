# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=lightdm-webkit2-greeter
_pkgname=web-greeter
pkgver=2.2.5
pkgrel=1
pkgdesc='LightDM greeter that uses WebKit2 for theming via HTML/JavaScript.'
arch=('i686' 'x86_64')
url='https://github.com/antergos/web-greeter'
license=('GPL3')
groups=('system')
makedepends=('gobject-introspection' 'meson' 'gettext' 'dbus-glib')
depends=('lightdm' 'webkit2gtk' 'accountsservice' 'gnome-backgrounds')
provides=('lightdm-webkit-greeter')
conflicts=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos')
replaces=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos')
backup=("etc/lightdm/${pkgname}.conf")
_artwork_url='https://sources.archlinux.org/other/artwork'
source=("https://github.com/Antergos/${_pkgname}/archive/${pkgver}.zip"
		"archlinux-logo.svg::${_artwork_url}/archlinux-logo-light-scalable.svg"
		'archlinux-user.svg')
md5sums=('634c6080144169c7529291bf1c8a1429'
         '1ae4cc2e2469acbe15775358ed6b11b4'
         'b270926ddd965fc63a632156cedd734d')


build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	_pixmaps='/usr/share/pixmaps'

	sed -ri \
		"s@\/usr.+antergos\.png@${_pixmaps}/archlinux-logo.svg@g;
		 s@\/usr.+logo-user\.png@${_pixmaps}/archlinux-user.svg@g" "data/${pkgname}.conf"

	cd build
	meson --prefix=/usr --libdir=lib ..
	ninja
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"

	DESTDIR="${pkgdir}" ninja install

	install -dm755 "${pkgdir}/usr/share/pixmaps"
	cp -t "${pkgdir}/usr/share/pixmaps" "${srcdir}"/*.svg
}

