# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3-notification
pkgname=(vte3-notification vte-notification-common)
pkgver=0.42.0
pkgrel=2
pkgdesc='Virtual Terminal Emulator widget for use with GTK3'
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gperf')
url='https://www.gnome.org'
source=(
	"https://download.gnome.org/sources/vte/${pkgver::4}/vte-${pkgver}.tar.xz"
	'0001-widget-Only-show-the-cursor-on-motion-if-moved.patch'
	'add-zsh-notfication-support.patch'
	'vte291-command-notify.patch'
)
sha256sums=(
	'2168f79d2043cbbe6d4375d01e54cebda71bb6f5d9dc8ad658b9a1dc1052de04'
	'4379593bdddbe7ebcf6efd808f6334ce86334426d07f7ad777a3aa2d1ee2c50d'
	'150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
	'd7dce79b0950b35052f60cacc7ce835a6111a4f3e833a5406590ff141fb41825'
)

prepare () {
	cd "vte-${pkgver}"

	patch -p1 -i '../0001-widget-Only-show-the-cursor-on-motion-if-moved.patch'
	patch -p1 -i '../vte291-command-notify.patch'
	patch -p1 -i '../add-zsh-notfication-support.patch'
}

build() {
	cd "vte-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc \
		--libexecdir=/usr/lib/vte \
		--localstatedir=/var --disable-static \
		--enable-introspection
	make
}

package_vte3-notification(){
	depends=('gtk3' 'vte-notification-common')
	provides=("vte3=${pkgver}")
	conflicts=('vte3')
	cd "vte-${pkgver}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}/etc/profile.d/vte.sh"
}

package_vte-notification-common() {
	pkgdesc='Common files used by vte and vte3'
	provides=("vte-common=${pkgver}")
	conflicts=('vte-common')
	cd "vte-${pkgver}"

	install -Dm644 src/vte.sh "${pkgdir}/etc/profile.d/vte.sh"
}
