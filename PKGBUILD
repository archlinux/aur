# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3-notification
pkgname=(vte3-notification vte-notification-common)
pkgver=0.41.90
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gperf')
url="http://www.gnome.org"
source=("https://download.gnome.org/sources/vte/${pkgver::4}/vte-${pkgver}.tar.xz"
	'add-zsh-notfication-support.patch'
	'vte-command-notify.patch')
sha256sums=('f1ee9d27962c97414e09dfeb886efe437006f557b068f39330e0ff3a2c301516'
	'150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
	'd88e870c6f2232e5a06ae4b45d6308aae5fa564f5b82dca460a743c71781eba4')

prepare () {
	cd "vte-${pkgver}"

	patch -p1 -i ../vte-command-notify.patch
	patch -p1 -i ../add-zsh-notfication-support.patch
}

build() {
	cd "vte-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc \
		--libexecdir=/usr/lib/vte \
		--localstatedir=/var --disable-static \
		--enable-introspection --enable-gnome-pty-helper
	make
}

package_vte3-notification(){
	depends=('gtk3' 'vte-notification-common')
	provides=("vte3=${pkgver}")
	conflicts=('vte3')
	options=('!emptydirs')

	cd "vte-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm "${pkgdir}/etc/profile.d/vte.sh"
}

package_vte-notification-common() {
	pkgdesc="Common files used by vte and vte3"
	depends=('glibc')
	provides=("vte-common=${pkgver}")
	conflicts=('vte-common')

	cd "vte-${pkgver}"
	install -d "${pkgdir}/usr/lib/vte/gnome-pty-helper"
	install -Dm644 src/vte.sh "${pkgdir}/etc/profile.d/vte.sh"
}
