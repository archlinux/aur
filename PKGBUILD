# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: LSUtigers3131
# Contributor: Luke Short <ekultails at gmail dot com>

pkgname=libpamac-full
_pkgname=libpamac
pkgver=11.7.0
_commit=49bfde599ed00c127869a2797b5bb26e28e11c2a
pkgrel=1
epoch=1
pkgdesc='Library for Pamac package manager based on libalpm - flatpak and snap support enabled'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/${_pkgname}"
license=('GPL3')
depends=(
	'libalpm.so=15'
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
sha256sums=('be2b9ca5574ec664feb1512ed1b66549f8de0b8aff540dc6e7e5117d1f41d333')
install='pamac.install'

_srcdir="$_pkgname"

build() {
	arch-meson "$_srcdir" 'build' -Denable-appstream=true -Denable-snap=true -Denable-flatpak=true
	meson compile -C 'build'
}

package() {
	backup=('etc/pamac.conf')
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
