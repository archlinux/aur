# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>
# Contributor: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-all
pkgver=11.7.0
pkgrel=1
pkgdesc='A GUI frontend for libalpm (everything in one package - snap, flatpak, appindicator, aur, appstream)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/$_pkgname"
license=('GPL3')
depends=('libnotify' 'libpamac-full' 'libhandy' 'libadwaita' 'pamac-cli')
optdepends=(
	'polkit-kde-agent: authentication agent for KDE'
	'polkit-qt5: Qt5 based authentication agent'
	'polkit-gnome: legacy authentication agent for Gnome'
	'mate-polkit: authentication agent for Mate'
	'plymouth: offline upgrades')
makedepends=('gettext' 'vala' 'meson' 'ninja' 'gobject-introspection')
conflicts=('pamac' 'pamac-gtk' 'pamac-common' 'pamac-aur' 'pamac-aur-git' 'pamac-flatpak' 'pamac-flatpak-gnome')
provides=("pamac=$pkgver-$pkgrel")
options=(!emptydirs)
source=("$url/-/archive/$pkgver/pamac-$pkgver.tar.gz")
sha256sums=('85d6575696f35c7a6268e8d259bb6c0d04c4075ff37e0d6800a7dfd7d12c5340')

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
