# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>
# Contributor: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-all
pkgver=11.7.3+10+g52ee429
_commit=52ee429e1fd8555d0fb54d8d46b968a46b3aefe8
pkgrel=1
pkgdesc='A GUI frontend for libalpm (everything in one package - snap, flatpak, appindicator, aur, appstream)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/$_pkgname"
license=('GPL-3.0-or-later')
depends=('libnotify' 'libpamac-full' 'libhandy' 'libadwaita' 'pamac-cli')
optdepends=(
	'polkit-kde-agent: authentication agent for KDE'
	'polkit-qt5: Qt5 based authentication agent'
	'polkit-gnome: legacy authentication agent for Gnome'
	'mate-polkit: authentication agent for Mate'
	'plymouth: offline upgrades')
makedepends=('asciidoc' 'vala' 'meson' 'gobject-introspection' 'git')
conflicts=('pamac' 'pamac-gtk' 'pamac-common' 'pamac-aur' 'pamac-aur-git' 'pamac-flatpak' 'pamac-flatpak-gnome')
provides=("pamac=$pkgver-$pkgrel")
options=(!emptydirs)
source=("git+${url}.git#commit=${_commit}")
sha256sums=('7f55b73884c077fcf7b27f8682871a40b941802e9038229ac2b14ef4f816c0d1')

_srcdir="$_pkgname"

pkgver() {
  cd "$_srcdir"
  git describe --tags --abbrev=7 | sed 's/^v//;s/-/+/g'
}

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
