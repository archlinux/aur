# Maintainer: Thomas Bork <sudobash418@gmail.com>

pkgname=pamac-classic
pkgver=7.3.0
pkgrel=5
pkgdesc="A Gtk3 frontend for libalpm - classic version"
arch=('x86_64')
url="https://git.cromer.cl/cromer/pamac-classic"
license=('GPL-3.0-or-later')
depends=('curl' 'libsoup' 'polkit' 'pacman' 'libalpm.so' 'libalpm.so>=14' 'libalpm.so<=15' 'libnotify' 'vte3')
makedepends=('vala' 'meson' 'gettext' 'gobject-introspection')
optdepends=('polkit-gnome: needed for authentication in Cinnamon, Gnome'
            'mate-polkit: needed for authentication in MATE'
            'lxsession: needed for authentication in Xfce, LXDE etc.')
conflicts=('pamac' 'pamac-aur')
provides=('pamac' 'pamac-aur')
install=pamac-classic.install

source=(
	"pamac-classic-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz"
	"0001-Update-libalpm-vapi-to-version-14.patch"
	"0002-Fix-pamac-system-daemon-for-new-libalpm-version.patch"
	"0003-ui-Wrap-licenses-field.patch"
)
sha256sums=('53673497e6f2a6cf44c8152b682bd32e07702a9fc469f280f5f2a286c1e8e770'
            'ffef9e69c104c0643dc89ec73925a31fc1b8b396474af02c86767b4b1f3ce42c'
            '0e267274e13fbf82c1b074c0278ea01e945cc4ecc491a194829de87be361c898'
            '9c83439e54afade11560a80dc883e00a6bdc5d2b85ee694058e8b866af659222')

prepare() {
	cd "${srcdir}/${pkgname}"

	patch -Nup1 < ../0001-Update-libalpm-vapi-to-version-14.patch
	patch -Nup1 < ../0002-Fix-pamac-system-daemon-for-new-libalpm-version.patch
	patch -Nup1 < ../0003-ui-Wrap-licenses-field.patch
}

build() {
	cd "${srcdir}/${pkgname}"

	# disable AUR as it is currently broken: https://git.cromer.cl/cromer/pamac-classic/issues/12
	meson setup --reconfigure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc -DDISABLE_AUR=true . build

	# build
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="$pkgdir" ninja -C build install
}
