# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3-notification
pkgname=(vte3-notification vte-notification-common)
pkgver=0.44.0
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora patches'
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gperf' 'glade')
url='https://www.gnome.org'
source=(
	"https://download.gnome.org/sources/vte/${pkgver::4}/vte-${pkgver}.tar.xz"
	'vte291-command-notify.patch'
	'add-zsh-notfication-support.patch'
)
sha256sums=(
	'93a3b1a71a885f416a119a5a8fb27b8f36bb176b8d0bec5e48188d1db5ef12aa'
	'd3efea55ac81ce41a2a6f1590ac7a138126cdf4fe79934c4d2725c3f9381058f'
	'150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
)

prepare () {
	cd "vte-${pkgver}"

	patch -p1 -i '../vte291-command-notify.patch'
	patch -p1 -i '../add-zsh-notfication-support.patch'
}

build() {
	cd "vte-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc \
		--libexecdir=/usr/lib/vte \
		--localstatedir=/var --disable-static \
		--enable-introspection --enable-glade-catalogue
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
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
