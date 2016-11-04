# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgbase='vte3-terminix-git'
pkgname=("${pkgbase}" 'vte-terminix-common-git')
pkgver=0.46.0+1.3.0.r102.ge9f1e1e
_vtever=0.46.0
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget for use with GTK3 with Fedora and Terminix patches'
arch=('x86_64')
url='https://github.com/gnunn1/terminix/tree/master/experimental/vte'
license=('LGPL')
depends=('gtk3' 'pcre2')
makedepends=('intltool' 'gobject-introspection' 'vala' 'gperf' 'glade' 'git')
options=('!emptydirs')
# Fedora patches: http://pkgs.fedoraproject.org/cgit/rpms/vte291.git/tree/
source=(
	"https://download.gnome.org/sources/vte/${_vtever::4}/vte-${_vtever}.tar.xz"
	"git+https://github.com/gnunn1/terminix"
	'vte291-command-notify-scroll-speed.patch'
	'add-zsh-notfication-support.patch'
)
sha256sums=(
	'5f7122e7860eb2470d310fc63df91d3ee32bab233729c2dc181a0cbc9b3249d7'
	'SKIP'
	'8143306bed082e7fe14c742675bd10e000d92fa9b135491ff121a5078b5a9ebe'
	'150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
)

pkgver() {
	cd terminix
	echo -n ${_vtever}+
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
	cd "vte-${_vtever}"
	echo '-> Making the patch-sets compatible'
	sed -r -e 's/(\-\s*gpointer padding\[)16/\115/g' \
    	-e 's/(\+\s*gpointer padding\[)15/\114/g' \
		../terminix/experimental/vte/alternate-screen.patch > ../alternate-screen-compat.patch
	echo '-> Applying Fedora patches'
	patch -p1 -i '../vte291-command-notify-scroll-speed.patch'
	patch -p1 -i '../add-zsh-notfication-support.patch'
	echo '-> Applying terminix patches'
	patch -p1 -i '../alternate-screen-compat.patch'
	patch -p1 -i '../terminix/experimental/vte/disable-bg-draw.patch'
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

package_vte3-terminix-git(){
	depends=('gtk3' 'vte-terminix-common-git')
	provides=("vte3=${_vtever}")
	conflicts=('vte3')
	cd "vte-${_vtever}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}/etc/profile.d/vte.sh"
}

package_vte-terminix-common-git() {
	pkgdesc='Common files used by vte and vte3'
	arch=('any')
	provides=("vte-common=${_vtever}")
	conflicts=('vte-common')
	cd "vte-${_vtever}"

	install -Dm644 'src/vte.sh' "${pkgdir}/etc/profile.d/vte.sh"
}
