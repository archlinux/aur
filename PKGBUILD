# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributer: Davi da Silva Böger <dsboger@gmail.com>

pkgbase='vte3-tilix'
pkgname=("${pkgbase}" 'vte-tilix-common')
pkgver=0.70.3
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget (GTK3) (Fedora and Tilix patches)'
arch=('x86_64')
url='https://github.com/gnunn1/tilix/tree/master/experimental/vte'
license=('LGPL')
depends=('gtk3' 'pcre2' 'gnutls')
makedepends=('gi-docgen' 'intltool' 'gobject-introspection' 'gtk-doc' 'vala' 'gperf' 'glade' 'git')
options=('!emptydirs')

# Fedora patches: https://pkgs.fedoraproject.org/cgit/rpms/vte291.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/vte291'
_frepobranch='rawhide'
_fpatchfile='vte291-cntnr-precmd-preexec-scroll.patch'
_fcommit='de03576168f1ec4beeb7330239f4debf3234b842'

# VTE source ref
_vtetag=${pkgver}

source=(
	"git+https://gitlab.gnome.org/GNOME/vte.git#tag=$_vtetag"
	"${_fpatchfile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile}"
	'add-zsh-notfication-support.patch'
	'alternate-screen.patch'
)
sha256sums=('SKIP'
            'e5672a857c51a620ca5448da29e4ea5b0e319c2a54416a4ca615b0e0392e00a9'
            '150a151404ca565f70259044661b2ef5cda43142ca677e7da324614eef8cf45a'
            '36fdf6a98c2be1b0c5b38a6116f160cdf0f270db688796ff1199234d64e49600')

prepare() {
	cd "vte"

	echo '-> Applying Fedora patches'
	patch -p1 -i "../${_fpatchfile}-${_fcommit}"
	#patch -p1 -i '../add-zsh-notfication-support.patch'

	echo '-> Applying tilix patch'
	patch -p1 -i "../alternate-screen.patch"
}

build() {
	arch-meson vte build -D b_lto=false -D docs=true -D gtk4=false
	meson compile -C build
}

package_vte3-tilix(){
	depends+=('vte-tilix-common')
	provides=("vte3=${pkgver}" "vte3-notification=${pkgver}-2" 'vte3-terminix-git')
	provides+=(libvte-2.91.so)
	conflicts=('vte3' 'vte3-notification' 'vte3-terminix-git')
	meson install -C build --destdir "$pkgdir"

	rm "${pkgdir}/etc/profile.d/vte.sh"
}

package_vte-tilix-common() {
	depends=('sh')
	pkgdesc='Common files used by vte and vte3'
	arch=('any')
	provides=("vte-common=${pkgver}" "vte-notification-common=${pkgver}-2" 'vte-terminix-common-git')
	conflicts=('vte-common' 'vte-notification-common' 'vte3-terminix-common-git')
	install -Dm644 'build/src/vte.sh' "${pkgdir}/etc/profile.d/vte.sh"
}
