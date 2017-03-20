# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgbase='vte3-tilix'
pkgname=("${pkgbase}" 'vte-tilix-common')
pkgver=0.46.1+1.5.4
_vtever=0.46.1
_tilixver=1.5.4
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
_frepobranch='f25'
_fpatchfile='vte291-command-notify-scroll-speed.patch'
source=(
	"https://download.gnome.org/sources/vte/${_vtever::4}/vte-${_vtever}.tar.xz"
	"${_fpatchfile}::${_frepourl}/plain/${_fpatchfile}?h=${_frepobranch}"
	'add-zsh-notfication-support.patch'
	"gperf-fix.patch::https://git.gnome.org/browse/vte/patch/?id=1226f58cd97aa06f0ce58791153ca1f58e89658a"
	"https://github.com/gnunn1/tilix/raw/1.5.4/experimental/vte/alternate-screen.patch"
	"https://github.com/gnunn1/tilix/raw/1.5.4/experimental/vte/disable-bg-draw.patch"
)
sha256sums=('8800cf8bc259704a12ad1853fb0eb43bfe3857af15242e6fb9f2c3fd95b3f5c6'
            '9238ca155af79ec4f55f13b82981ea97745c26e3fcc87ab6917a1d41b4b9d852'
            '150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
            '7a2b1c74da87df40507df8a41524209a7e8aa77250af2fd11153beb3999db139'
            '980b6bc75a30ec56fe70387784083b5c7ded79715b7a0611e1d4358ee27c4720'
            'aa56313332850becb0b02aba1e05888ed978f7d8c006147679e2544cc0ca40cf')

prepare() {
	cd "vte-${_vtever}"
	patch -p1 -i '../gperf-fix.patch'
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
}

build() {
	cd "vte-${_vtever}"
	./configure --prefix='/usr' --sysconfdir='/etc' \
		--libexecdir='/usr/lib/vte' \
		--localstatedir='/var' --disable-static \
		--enable-introspection --enable-glade-catalogue --enable-gtk-doc
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package_vte3-tilix(){
	depends=('gtk3' 'vte-tilix-common')
	provides=("vte3=${_vtever}" "vte3-notification=${_vtever}-2")
	conflicts=('vte3' 'vte3-notification')
	cd "vte-${_vtever}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}/etc/profile.d/vte.sh"
}

package_vte-tilix-common() {
	pkgdesc='Common files used by vte and vte3'
	arch=('any')
	provides=("vte-common=${_vtever}" "vte-notification-common=${_vtever}-2")
	conflicts=('vte-common' 'vte-notification-common')
	cd "vte-${_vtever}"

	install -Dm644 'src/vte.sh' "${pkgdir}/etc/profile.d/vte.sh"
}
