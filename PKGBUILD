# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: LSUtigers3131
# Contributor: Luke Short <ekultails at gmail dot com>

pkgname=libpamac-full
_pkgname=libpamac
pkgver=11.7.4.3.gc7efe92
_commit=c7efe923f980a3f5966f376bd6d6e6146539a970
pkgrel=1
epoch=1
pkgdesc='Library for Pamac package manager based on libalpm - flatpak and snap support enabled'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
	'libalpm.so=16'
	'flatpak'
	'snapd'
	'snapd-glib'
	'archlinux-appstream-data'
	'appstream'
	'polkit'
	'libsoup3'
	'git'
	'json-glib'
	'dbus-glib')
makedepends=('vala' 'meson' 'gobject-introspection')
options=(!emptydirs)
provides=($_pkgname)
conflicts=('libpamac-aur' 'libpamac-flatpak' $_pkgname 'libpamac-full-dev')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('4b297f6195cc248107ca5f9f21325a0992ba5d1260c7fb077b6c65c44af302b4')
install='pamac.install'

_srcdir="$_pkgname"

pkgver() {
	cd "$_srcdir"
	git describe --tags --abbrev=7 | sed 's/^v//;s/-/./g'
}

build() {
	arch-meson "$_srcdir" 'build' -Denable-appstream=true -Denable-snap=true -Denable-flatpak=true
	meson compile -C 'build'
}

package() {
	backup=('etc/pamac.conf')
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
