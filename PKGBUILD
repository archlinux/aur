# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor Will Price <will.price94+aur@gmail.com>

pkgname=0verkill-git
pkgver=r153.b6df272
pkgrel=1
pkgdesc="Bloody 2D action deathmatch-like game in ASCII-ART"
arch=('i686' 'x86_64')
url="https://github.com/hackndev/0verkill"
license=('GPL-2.0-only')
depends=('xorgproto' 'libx11' 'libxpm' 'libbsd')
makedepends=('git' 'cmake')
provides=('0verkill')
conflicts=('0verkill')
source=('git+https://github.com/patlefort/0verkill.git')
sha256sums=('SKIP')

_srcdir='0verkill'

pkgver() {
	cd "$_srcdir"
	( set -o pipefail
	  git describe --abbrev=7 --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cmake -S "$_srcdir" -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "$_srcdir/0verkill.appdata.xml" -t "${pkgdir}/usr/share/appdata"
	install -Dm644 "$_srcdir/0verkill.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "$_srcdir/0verkill.desktop" -t "${pkgdir}/usr/share/applications"
}
