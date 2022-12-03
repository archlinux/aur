# Maintainer: éclairevoyant
# Contributor: Philip Goto <philip dot goto at gmail.com>

_pkgname=adwaita-icon-theme
pkgbase="$_pkgname-git"
pkgname=("$pkgbase" 'adwaita-cursors-git')
pkgver=43.r68.g855de98ff
pkgrel=1
pkgdesc='GNOME standard icons'
arch=('any')
url="https://gitlab.gnome.org/GNOME/$_pkgname"
license=('LGPL3' 'CCPL:by-sa')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache' 'librsvg')
makedepends=('git' 'gtk3')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	autoreconf -fvi
}

build() {
	cd $_pkgname
	./configure --prefix=/usr
	make
}

check() {
	make -C $_pkgname check
}

package_adwaita-icon-theme-git() {
	depends+=('adwaita-cursors')
	provides=("$_pkgname")
	conflicts=("$_pkgname")

	make -C $_pkgname DESTDIR="$pkgdir" install
	rm -rf "$pkgdir/usr/share/icons/Adwaita/cursors/"
}

package_adwaita-cursors-git() {
	pkgdesc='GNOME standard cursors'
	unset depends
	provides=('adwaita-cursors')
	conflicts=('adwaita-cursors')

	install -dm755 "$pkgdir/usr/share/icons/Adwaita/"
	cp -r --no-preserve=ownership $_pkgname/Adwaita/cursors "$pkgdir/usr/share/icons/Adwaita/"
}
