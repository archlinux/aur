# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>
# Contributor: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-all
pkgver=11.0.1
pkgrel=2
pkgdesc="A Gtk3 frontend for libalpm (everything in one package - snap, flatpak, appindicator)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/$_pkgname"
license=('GPL3')
depends=('libnotify' 'libpamac-full' 'libhandy' 'libadwaita')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome')
makedepends=('gettext' 'vala' 'meson' 'ninja' 'gobject-introspection')
conflicts=('pamac' 'pamac-gtk' 'pamac-common' 'pamac-aur' 'pamac-aur-git' 'pamac-flatpak' 'pamac-flatpak-gnome')
provides=("pamac=$pkgver-$pkgrel")
options=(!emptydirs)
source=("$url/-/archive/$pkgver/pamac-$pkgver.tar.gz")
sha256sums=('f80cc219915a8a86b685461c1ed9182fafcb84b9f72f1f4d128fadce8122eda7')

_srcdir="$_pkgname-$pkgver"

prepare() {
	cd "$_srcdir"
	# adjust version string
	sed -i -e "s|\"$pkgver\"|\"$pkgver-$pkgrel\"|g" 'src/version.vala'
}

build() {
	arch-meson "$_srcdir" 'build' -Denable-fake-gnome-software=false
	meson compile -C 'build'
}

package() {
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
