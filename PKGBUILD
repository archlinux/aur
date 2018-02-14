# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgbase='vte3-tilix'
pkgname=("${pkgbase}" 'vte-tilix-common')
_vtever=0.50.2
_tilixver=1.7.1
pkgver=0.50.2+1.7.1
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
_frepobranch='f27'
_fpatchfile='vte291-command-notify-scroll-speed.patch'
_fcommit='7dce41935b8df88c353b88854780661a0232e699'

# VTE source ref
#_vtecommit='837cce9ced6bfe317cb97aeca171001da92cb3a1'
_vtetag=${_vtever}

_tilixpatchfile1='alternate-screen.patch'
_tilixpatchfile2='disable-bg-draw.patch'
source=(
	#"git+https://git.gnome.org/browse/vte#commit=$_vtecommit"
	"git+https://git.gnome.org/browse/vte#tag=$_vtetag"
	"${_fpatchfile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile}"
	'add-zsh-notfication-support.patch'
	"${_tilixpatchfile1}-${_tilixver}::https://github.com/gnunn1/tilix/raw/${_tilixver}/experimental/vte/${_tilixpatchfile1}"
	"${_tilixpatchfile2}-${_tilixver}::https://github.com/gnunn1/tilix/raw/${_tilixver}/experimental/vte/${_tilixpatchfile2}"
)
sha256sums=('SKIP'
            '50bce46a90739eb6f150528b5c29a2beb08da529038762de050901055a225371'
            '150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
            '980b6bc75a30ec56fe70387784083b5c7ded79715b7a0611e1d4358ee27c4720'
            'aa56313332850becb0b02aba1e05888ed978f7d8c006147679e2544cc0ca40cf')
pkgver() {
	cd vte

	echo `git describe --tags | sed 's/-/+/g'`+$_tilixver
}

prepare() {
	cd "vte"

	echo '-> Making the patch-sets compatible'
	sed -r -e 's/(\-\s*gpointer padding\[)16/\115/g' \
    	-e 's/(\+\s*gpointer padding\[)15/\114/g' \
		-i "../${_tilixpatchfile1}-${_tilixver}"

	echo '-> Applying Fedora patches'
	patch -p1 -i "../${_fpatchfile}-${_fcommit}"
	patch -p1 -i '../add-zsh-notfication-support.patch'

	echo '-> Applying terminix patches'
	patch -p1 -i "../${_tilixpatchfile1}-${_tilixver}"
	patch -p1 -i "../${_tilixpatchfile2}-${_tilixver}"

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
	provides=("vte3=${_vtever}" "vte3-notification=${_vtever}-2" 'vte3-terminix-git')
	conflicts=('vte3' 'vte3-notification' 'vte3-terminix-git')
	cd "vte"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}/etc/profile.d/vte.sh"
}

package_vte-tilix-common() {
	depends=('sh')
	pkgdesc='Common files used by vte and vte3'
	arch=('any')
	provides=("vte-common=${_vtever}" "vte-notification-common=${_vtever}-2" 'vte-terminix-common-git')
	conflicts=('vte-common' 'vte-notification-common' 'vte3-terminix-common-git')
	cd "vte"

	install -Dm644 'src/vte.sh' "${pkgdir}/etc/profile.d/vte.sh"
}
