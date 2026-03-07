# Maintainer: Thomas Bork <sudobash418@gmail.com>

pkgname=pamac-classic-fixed
pkgver=7.3.0.r764.g76e060f
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm - classic version - AUR not working"
arch=('x86_64')
url="https://github.com/boussou/pamac-classic"
license=('GPL-3.0-or-later')
depends=('curl' 'libsoup' 'polkit' 'pacman' 'libalpm.so' 'libnotify' 'vte3')
makedepends=('vala' 'meson' 'gettext' 'gobject-introspection')
optdepends=('polkit-gnome: needed for authentication in Cinnamon, Gnome'
            'mate-polkit: needed for authentication in MATE'
            'lxsession: needed for authentication in Xfce, LXDE etc.')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
install=pamac-classic.install

source=(
	"git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "7.3.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
}

build() {
	cd "${srcdir}/${pkgname}"

 # Put back the AUR support = option must stay empty means FALSE
 # previously was: -DDISABLE_AUR=true
	meson setup --wipe --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc -DDISABLE_AUR= build
	meson compile -C build
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="$pkgdir" meson install -C build
}
