# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgbase='vte3-tilix'
pkgname=("${pkgbase}" 'vte-tilix-common')
_vtever=0.48.2
_tilixver=1.5.6
pkgver=0.48.2+2+g837cce9c+1.5.6
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora and Tilix patches'
arch=('x86_64')
url='https://github.com/gnunn1/tilix/tree/master/experimental/vte'
license=('LGPL')
depends=('gtk3' 'pcre2' 'gnutls')
makedepends=('intltool' 'gobject-introspection' 'gtk-doc' 'vala' 'gperf' 'glade' 'git')
options=('!emptydirs')
# Fedora patches: http://pkgs.fedoraproject.org/cgit/rpms/vte291.git/tree/
_frepourl='http://pkgs.fedoraproject.org/cgit/rpms/vte291.git'
_frepobranch='f26'
_fpatchfile='vte291-command-notify-scroll-speed.patch'
_vtecommit=837cce9ced6bfe317cb97aeca171001da92cb3a1
source=(
	"git+https://git.gnome.org/browse/vte#commit=$_vtecommit"
	"${_fpatchfile}::${_frepourl}/plain/${_fpatchfile}?h=${_frepobranch}"
	'add-zsh-notfication-support.patch'
	"https://github.com/gnunn1/tilix/raw/${_tilixver}/experimental/vte/alternate-screen.patch"
	"https://github.com/gnunn1/tilix/raw/${_tilixver}/experimental/vte/disable-bg-draw.patch"
)
sha256sums=('SKIP'
            'd32201c04d9f688195725bf76d7c618ae24178a2578da01c507d8216f082cf8e'
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
		-i "../alternate-screen.patch"

	echo '-> Applying Fedora patches'
	patch -p1 -i "../${_fpatchfile}"
	patch -p1 -i '../add-zsh-notfication-support.patch'

	echo '-> Applying terminix patches'
	patch -p1 -i '../alternate-screen.patch'
	patch -p1 -i '../disable-bg-draw.patch'

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
