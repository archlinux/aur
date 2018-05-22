# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgbase='vte3-tilix'
pkgname=("${pkgbase}" 'vte-tilix-common')
pkgver=0.52.2
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora and Tilix patches'
arch=('x86_64')
url='https://github.com/gnunn1/tilix/tree/master/experimental/vte'
license=('LGPL')
depends=('gtk3' 'pcre2' 'gnutls')
makedepends=('intltool' 'gobject-introspection' 'gtk-doc' 'vala' 'gperf' 'glade' 'git')
options=('!emptydirs')

# Fedora patches: https://src.fedoraproject.org/cgit/rpms/vte291.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/vte291'
_frepobranch='f28'
_fpatchfile='vte291-command-notify-scroll-speed.patch'
_fcommit='31a8d1b3ad4c16edc50b605f7240888de69790ac'

# VTE source ref
#_vtecommit='837cce9ced6bfe317cb97aeca171001da92cb3a1'
_vtetag=${pkgver}

# Tilix source ref
_tilixpatchfile1='alternate-screen.patch'
_tilixcommit='263160c6cb3adb03d25e13b8a96e56d8e8a4ebed'

source=(
	#"git+https://git.gnome.org/browse/vte#commit=$_vtecommit"
	"git+https://git.gnome.org/browse/vte#tag=$_vtetag"
	"${_fpatchfile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile}"
	'add-zsh-notfication-support.patch'
	"${_tilixpatchfile1}-${_tilixcommit}::https://github.com/gnunn1/tilix/raw/${_tilixcommit}/experimental/vte/0.52/alternate-screen.patch"
)
sha256sums=('SKIP'
            'b22e1276202a10007004f19002ceb5eb186f1529e39a6a451e0b82f3d6bce9ee'
            '150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
            '09c225fc0aea4f88946b1ce637788997b76f0b16c8b1287671046c2b7e1a590d')

prepare() {
	cd "vte"

	echo '-> Making the patch-sets compatible'
	sed -r -e 's/(\-\s*gpointer padding\[)16/\115/g' \
		-e 's/(\+\s*gpointer padding\[)15/\114/g' \
		-i "../${_tilixpatchfile1}-${_tilixcommit}"

	echo '-> Applying Fedora patches'
	patch -p1 -i "../${_fpatchfile}-${_fcommit}"
	patch -p1 -i '../add-zsh-notfication-support.patch'

	echo '-> Applying tilix patch'
	patch -p1 -i "../${_tilixpatchfile1}-${_tilixcommit}"

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

package_vte3-tilix(){
	depends+=('vte-tilix-common')
	provides=("vte3=${pkgver}" "vte3-notification=${pkgver}-2" 'vte3-terminix-git')
	conflicts=('vte3' 'vte3-notification' 'vte3-terminix-git')
	cd "vte"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}/etc/profile.d/vte.sh"
}

package_vte-tilix-common() {
	depends=('sh')
	pkgdesc='Common files used by vte and vte3'
	arch=('any')
	provides=("vte-common=${pkgver}" "vte-notification-common=${pkgver}-2" 'vte-terminix-common-git')
	conflicts=('vte-common' 'vte-notification-common' 'vte3-terminix-common-git')
	cd "vte"

	install -Dm644 'src/vte.sh' "${pkgdir}/etc/profile.d/vte.sh"
}
