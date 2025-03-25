# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tobias T. <OldShatterhand at gmx-topmail dot de>
# Contributor: SanskritFritz (gmail)
# Maintainer: Bink

pkgname=bibletime-git
_gitname="bibletime"
pkgver=3.1.0.r32
pkgrel=2
epoch=2
pkgdesc="A Bible study application based on the Sword library and Qt toolkit."
arch=('x86_64' 'i686')
url="https://bibletime.info/"
license=('GPL-2.0-only')
depends=('sword>=1.8.1' 'clucene>=2.0' 'qt6-webengine>=6.7' 'qt6-svg>=6.7')
makedepends=('cmake>=3.25' 'docbook-xsl' 'docbook-xml' 'fop' 'git' 'po4a' 'qt6-tools>=6.7' 'pkgconf')
provides=('bibletime')
conflicts=('bibletime')
source=("git+https://github.com/bibletime/bibletime.git")
md5sums=('SKIP')

pkgver() {
	git -C $_gitname describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.g.*//'
}

build() {
	_xslstylespath="/usr/share/xml/docbook/xsl-stylesheets-"$(pacman -Q docbook-xsl | cut -d ' ' -f 2 | cut -d '-' -f 1)
	cd "$srcdir/$_gitname" || exit
	sed -i 's/@BT_VERSION_FULL@//g' ./cmake/platforms/linux/bibletime.desktop.cmake

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_HANDBOOK_HTML=ON \
		-DBUILD_HANDBOOK_HTML_LANGUAGES="en" \
		-DBUILD_HANDBOOK_PDF=OFF \
		-DBUILD_HANDBOOK_PDF_LANGUAGES="en" \
		-DBUILD_HOWTO_HTML=ON \
		-DBUILD_HOWTO_HTML_LANGUAGES="en" \
		-DBUILD_HOWTO_PDF=OFF \
		-DBUILD_HOWTO_PDF_LANGUAGES="en" \
		-DBT_DOCBOOK_XSL_HTML_CHUNK_XSL="$_xslstylespath"/html/chunk.xsl \
		-Wno-dev \
		-S ./
	make
}

package() {
	cd "$srcdir/$_gitname" || exit
	make DESTDIR="$pkgdir" install
}
