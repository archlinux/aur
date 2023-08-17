# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>
# Contributor: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-all
pkgver=11.6.0
pkgrel=3
pkgdesc='A GUI frontend for libalpm (everything in one package - snap, flatpak, appindicator, aur, appstream)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/$_pkgname"
license=('GPL3')
depends=('libnotify' 'libpamac-full' 'libhandy' 'libadwaita' 'pamac-cli')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome')
makedepends=('gettext' 'vala' 'meson' 'ninja' 'gobject-introspection')
conflicts=('pamac' 'pamac-gtk' 'pamac-common' 'pamac-aur' 'pamac-aur-git' 'pamac-flatpak' 'pamac-flatpak-gnome')
provides=("pamac=$pkgver-$pkgrel")
options=(!emptydirs)
source=(
	"$url/-/archive/$pkgver/pamac-$pkgver.tar.gz"
	"$url/-/commit/b6d4815b051d4048f00fa05a57959a5681a031b5.patch")
sha256sums=('e50d4b0f4e2acaf76c50ef2d88e0913f966de5d34adfdf33d07d244ab03dda73'
            'ab0c4e94002b5ceb4987298a070c54d12b35f56e7e54fd2d93567e4e5e797795')

_srcdir="$_pkgname-$pkgver"

prepare() {
	cd "$_srcdir"
	patch -Np1 -i "${srcdir}/b6d4815b051d4048f00fa05a57959a5681a031b5.patch"
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
