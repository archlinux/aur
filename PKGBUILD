# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3-notification
pkgname=(vte3-notification vte-notification-common)
pkgver=0.42.3
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget for use with GTK3'
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gperf' 'glade')
url='https://www.gnome.org'
source=(
	"https://download.gnome.org/sources/vte/${pkgver::4}/vte-${pkgver}.tar.xz"
	'0001-widget-Only-show-the-cursor-on-motion-if-moved.patch'
	'0001-emulation-Track-the-cursor-separately-for-the-two-sc.patch'
	'vte291-command-notify.patch'
	'add-zsh-notfication-support.patch'
)
sha256sums=(
	'96e98a40eae82d04c08f2ca1d2672659596e5b75626ba7d78df2412878ae62a0'
	'4379593bdddbe7ebcf6efd808f6334ce86334426d07f7ad777a3aa2d1ee2c50d'
	'2a3a37001077f271fa252b1ed3cf21c7fc2f046dbcc46df52f61aebf5284b19c'
	'f6eb91bdd27f29560e767b529c4e08d7fccf7ceae78fb45a44a511fde55c9a32'
	'150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
)

prepare () {
	cd "vte-${pkgver}"

	patch -p1 -i '../0001-widget-Only-show-the-cursor-on-motion-if-moved.patch'
	patch -p1 -i '../0001-emulation-Track-the-cursor-separately-for-the-two-sc.patch'
	patch -p1 -i '../vte291-command-notify.patch'
	patch -p1 -i '../add-zsh-notfication-support.patch'
}

build() {
	cd "vte-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc \
		--libexecdir=/usr/lib/vte \
		--localstatedir=/var --disable-static \
		--enable-introspection --enable-glade-catalogue
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/ if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/ func_append compile_command " -Wl,-O1,--as-needed"\n func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
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
