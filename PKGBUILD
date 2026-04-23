# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>
# Contributor: LSUtigers3131

: ${_use_jemalloc:=0}

_pkgname=pamac
pkgname=${_pkgname}-all
pkgver=11.7.5
_commit=f94121cf99a4b1e10eb5ccd83098a08ba029c40e
pkgrel=1
pkgdesc='A GUI frontend for libalpm (everything in one package - snap, flatpak, appindicator, aur, appstream)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/$_pkgname"
license=('GPL-3.0-or-later')
depends=('libnotify' 'libpamac-full' 'libhandy' 'libadwaita' 'pamac-cli')
if ((_use_jemalloc)); then
	depends+=('jemalloc')
fi
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
sha256sums=('a1e82520739403d1b769c87731355ac5f5710b5626fbf77dce8eabea8506c4c1')

_srcdir="$_pkgname"

pkgver() {
  cd "$_srcdir"
  git describe --tags --abbrev=7 | sed 's/^v//;s/-/./g'
}

prepare() {
	cd "$_srcdir"
	# adjust version string
	sed -i -e "s|\"$pkgver\"|\"$pkgver-$pkgrel\"|g" 'src/version.vala'
}

build() {
	local opts=(
		-Denable-fake-gnome-software=false
	)
	if ((_use_jemalloc)); then
		opts+=(-Djemalloc=true)
	else
		opts+=(-Djemalloc=false)
	fi
	arch-meson "$_srcdir" 'build' "${opts[@]}"
	meson compile -C 'build'
}

package() {
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
