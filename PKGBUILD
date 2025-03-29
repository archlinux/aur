# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>
# Contributor: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-all
pkgver=11.7.2
_commit=71ced277e5931ccea2433ece291430481a2694ee
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
sha256sums=('b7166976642b21e9ce22c9f0a0b6a2708ffe4f1c91cf9ec3b52231d2eb13d66e')

_srcdir="$_pkgname"

pkgver() {
  cd "$_srcdir"
  git describe --tags | sed 's/^v//;s/-/+/g'
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
