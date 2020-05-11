# Maintainer: Markus Schaaf markuschaaf@gmail.com
#
pkgname=gedit-latex-git
pkgdesc='plugin that provides features to ease the edition of latex documents'
url='https://wiki.gnome.org/Apps/Gedit/LaTeXPlugin'
pkgver=3.20.r62.g3ca1aea
pkgrel=1
arch=(any)
license=(GPL3)
source=('git+https://gitlab.gnome.org/GNOME/gedit-latex.git')
sha256sums=(SKIP)
depends=('python>=3.0.0' 'libpeas>=1.14.1')
makedepends=(git gobject-introspection)
provides=(gedit-latex)
conflicts=(gedit-latex)

pkgver() {
	cd gedit-latex
	(	set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"	)
}

build() {
	cd gedit-latex
	meson setup build.$CHOST --prefix=/usr --buildtype=release
	ninja -C build.$CHOST
}

package() {
	cd gedit-latex
	DESTDIR="$pkgdir" ninja -C build.$CHOST install
}
