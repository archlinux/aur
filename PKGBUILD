# Maintainer: Markus Schaaf markuschaaf@gmail.com
#
pkgname=gedit-latex-git
pkgdesc='plugin that provides features to ease the edition of latex documents'
url='https://wiki.gnome.org/Apps/Gedit/LaTeXPlugin'
pkgver=3.20.r70.g2b62591
pkgrel=1
arch=(any)
license=(GPL3)
source=(
	'git+https://gitlab.gnome.org/GNOME/gedit-latex.git'
	tools.xml.zst
)
sha256sums=(
	SKIP
	'a5255710fdf53feac2e171c13c7c97a17469801837456450eca4fe2fb73aae4b'
)
depends=('python>=3.0.0' 'libpeas>=1.14.1')
makedepends=(git gobject-introspection)
optdepends=(
	'texlive-core: (or texlive-most) to compile latex documents'
	'biber: to compile bibliographies'
)
provides=(gedit-latex)
conflicts=(gedit-latex)

pkgver() {
	cd gedit-latex
	(	set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"	)
}

prepare() {
	zstd -fd tools.xml.zst -o gedit-latex/data/tools.xml
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
