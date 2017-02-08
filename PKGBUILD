# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase='vte3-notification'
pkgname=("${pkgbase}" 'vte-notification-common')
pkgver=0.46.1
pkgrel=5
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora patches'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Terminal/VTE'
license=('LGPL')
depends=('gtk3' 'pcre2' 'gnutls')
makedepends=('intltool' 'gobject-introspection' 'gtk-doc' 'vala' 'gperf' 'glade')
options=('!emptydirs')
# Fedora patches: http://pkgs.fedoraproject.org/cgit/rpms/vte291.git/tree/
_frepourl='http://pkgs.fedoraproject.org/cgit/rpms/vte291.git'
_frepobranch='f25'
_fpatchfile='vte291-command-notify-scroll-speed.patch'
source=(
	"https://download.gnome.org/sources/vte/${pkgver::4}/vte-${pkgver}.tar.xz"
	"${_fpatchfile}::${_frepourl}/plain/${_fpatchfile}?h=${_frepobranch}"
	'add-zsh-notfication-support.patch'
	"gperf-fix.patch::https://git.gnome.org/browse/vte/patch/?id=1226f58cd97aa06f0ce58791153ca1f58e89658a"
)
sha256sums=(
	'8800cf8bc259704a12ad1853fb0eb43bfe3857af15242e6fb9f2c3fd95b3f5c6'
	'9238ca155af79ec4f55f13b82981ea97745c26e3fcc87ab6917a1d41b4b9d852'
	'150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
	'7a2b1c74da87df40507df8a41524209a7e8aa77250af2fd11153beb3999db139'
)

prepare () {
	cd "vte-${pkgver}"

	patch -p1 -i '../gperf-fix.patch'
	patch -p1 -i "../${_fpatchfile}"
	patch -p1 -i '../add-zsh-notfication-support.patch'
}

build() {
	cd "vte-${pkgver}"
	./configure --prefix='/usr' --sysconfdir='/etc' \
		--libexecdir='/usr/lib/vte' \
		--localstatedir='/var' --disable-static \
		--enable-introspection --enable-glade-catalogue --enable-gtk-doc
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
