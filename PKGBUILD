# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: LSUtigers3131 
# Contributor: Luke Short <ekultails at gmail dot com>

pkgname=libpamac-full
_pkgname=libpamac
pkgver=11.6.2
pkgrel=2
epoch=1
pkgdesc='Library for Pamac package manager based on libalpm - flatpak and snap support enabled'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'flatpak' 'snapd' 'snapd-glib' 'archlinux-appstream-data' 'appstream')
makedepends=('gettext' 'vala' 'meson' 'ninja' 'gobject-introspection' 'git')
options=(!emptydirs)
provides=($_pkgname)
conflicts=('libpamac-aur' 'libpamac-flatpak' $_pkgname 'libpamac-full-dev')
#source=("https://gitlab.manjaro.org/applications/libpamac/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
source=(
	"git+https://gitlab.manjaro.org/applications/libpamac.git#commit=e74fe0e1c15f4fd14d02ff12650be3fde47287d7"
	"${pkgname}-appstream-1.0.patch")
sha256sums=('SKIP'
            '8baf2947ac7668c90720f98d998b345ef285d0355eff96a0289534ce6241923e')
install='pamac.install'

#_srcdir="$_pkgname-$pkgver"
_srcdir="$_pkgname"

prepare() {
	cd "$_srcdir"
	patch -p1 -i "${srcdir}/${pkgname}-appstream-1.0.patch"
}

build() {
	arch-meson "$_srcdir" 'build' -Denable-snap=true -Denable-flatpak=true
	meson compile -C 'build'
}

package() {
	backup=('etc/pamac.conf')
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
