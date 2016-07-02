# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase='vte3-notification'
pkgname=("${pkgbase}" 'vte-notification-common')
pkgver=0.44.2
pkgrel=2
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora patches'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Terminal/VTE'
license=('LGPL')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gperf' 'glade')
options=('!emptydirs')
source=(
	"https://download.gnome.org/sources/vte/${pkgver::4}/vte-${pkgver}.tar.xz"
	'vte291-command-notify-scroll-speed.patch'
	'add-zsh-notfication-support.patch'
)
sha256sums=(
	'a1ea594814bb136a3a9a6c7656b46240571f6a198825c1111007fe99194b0949'
	'ad9c9cd940426e9beb81ab40d4e6936662ccf49f86de56509b51047cb8bd17b1'
	'150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
)

prepare () {
	cd "vte-${pkgver}"

	patch -p1 -i '../vte291-command-notify-scroll-speed.patch'
	patch -p1 -i '../add-zsh-notfication-support.patch'
}

build() {
	cd "vte-${pkgver}"
	./configure --prefix='/usr' --sysconfdir='/etc' \
		--libexecdir='/usr/lib/vte' \
		--localstatedir='/var' --disable-static \
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
	arch=('any')
	provides=("vte-common=${pkgver}")
	conflicts=('vte-common')
	cd "vte-${pkgver}"

	install -Dm644 'src/vte.sh' "${pkgdir}/etc/profile.d/vte.sh"
}
