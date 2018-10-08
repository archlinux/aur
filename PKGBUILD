# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase='vte3-notification'
pkgname=("${pkgbase}" 'vte-notification-common')
pkgver=0.54.1
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora patches'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Terminal/VTE'
license=('LGPL')
depends=('gtk3' 'pcre2' 'gnutls')
makedepends=('git' 'intltool' 'gobject-introspection' 'gtk-doc' 'vala' 'gperf' 'glade')
options=('!emptydirs')

# Fedora patches: https://pkgs.fedoraproject.org/cgit/rpms/vte291.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/vte291'
_frepobranch='f29'
_fpatchfile='vte291-command-notify-scroll-speed.patch'
_fcommit='94ec580d203552c728f6d46ce539fd321d991500'

# VTE source ref
#_vtecommit='837cce9ced6bfe317cb97aeca171001da92cb3a1'
_vtetag=${pkgver}

source=(
	#"git+https://git.gnome.org/browse/vte#commit=$_vtecommit"
	"git+https://git.gnome.org/browse/vte#tag=$_vtetag"
	"${_fpatchfile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile}"
	'add-zsh-notfication-support.patch'
)
sha256sums=('SKIP'
            '5de49179d88acba730e7446913724ca012b4b5aedb6392b2547a11725829180b'
            '150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a')

#pkgver() {
#	cd vte
#	git describe --tags | sed 's/-/+/g'
#}

prepare () {
	cd "vte"

	patch -p1 -i "../${_fpatchfile}-${_fcommit}"
	#patch -p1 -i '../add-zsh-notfication-support.patch'

	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "vte"
	./configure --prefix='/usr' --sysconfdir='/etc' \
		--libexecdir='/usr/lib/vte' \
		--localstatedir='/var' --disable-static \
		--enable-introspection --enable-glade-catalogue --enable-gtk-doc
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package_vte3-notification(){
	depends+=('vte-notification-common')
	provides=("vte3=${pkgver}")
	conflicts=('vte3')

	cd "vte"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}/etc/profile.d/vte.sh"
}

package_vte-notification-common() {
	depends=('sh')
	pkgdesc='Common files used by vte and vte3'
	arch=('any')
	provides=("vte-common=${pkgver}")
	conflicts=('vte-common')
	cd "vte"

	install -Dm644 'src/vte.sh' "${pkgdir}/etc/profile.d/vte.sh"
}
