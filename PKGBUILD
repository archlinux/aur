# Maintainer: éclairevoyant
# Contributor: Philip Goto <philip dot goto at gmail.com>

_pkgname=adwaita-icon-theme
pkgbase="$_pkgname-git"
pkgname=("$pkgbase" adwaita-cursors-git)
pkgver=44.0.r44.ge1528589b
pkgrel=1
pkgdesc='GNOME standard icons'
arch=(any)
url="https://gitlab.gnome.org/GNOME/$_pkgname"
license=(LGPL3 CCPL:by-sa)
depends=(gtk-update-icon-cache hicolor-icon-theme librsvg)
makedepends=(git gtk3 meson)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	arch-meson $_pkgname build
}

build() {
	meson compile -C build
}

package_adwaita-icon-theme-git() {
	depends+=('adwaita-cursors')
	provides=("$_pkgname")
	conflicts=("$_pkgname")

	meson install -C build --destdir "$pkgdir"
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
