# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=adwaita-icon-theme-git
pkgver=41.0.r160.gac378cd37
pkgrel=1
pkgdesc='GNOME standard icons'
arch=(any)
url='https://gitlab.gnome.org/GNOME/adwaita-icon-theme'
license=(LGPL3 CCPL:by-sa)
depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)
makedepends=(git gtk3)
provides=(adwaita-icon-theme)
conflicts=(adwaita-icon-theme)
source=("git+${url}.git")
b2sums=(SKIP)

pkgver() {
	cd adwaita-icon-theme
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd adwaita-icon-theme

	# Revert settings icons removal to keep compatibility with GNOME 41
	git revert -n 1b528b4c1b876381e2a8274cb87408ab4860a9c1 || true
	git checkout master -- src/symbolic/core.svg

	autoreconf -fvi
}
  
build() {
	cd adwaita-icon-theme
	./configure --prefix=/usr
	make
}

check() {
	cd adwaita-icon-theme
	make check
}

package() {
	cd adwaita-icon-theme
	make DESTDIR="$pkgdir" install
}
