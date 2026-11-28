# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: LSUtigers3131
# Contributor: Luke Short <ekultails at gmail dot com>

pkgname=libpamac-full
_pkgname=libpamac
pkgver=12.0.0
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
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('051e1101ef03b3ff161d6f934f49dfdc46e6661f6dfeabcc01879e189ee9979d')
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
