# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tobias T. <OldShatterhand at gmx-topmail dot de>
# Contributor: SanskritFritz (gmail)
# Maintainer: Bink

pkgname=bibletime-git
_gitname="bibletime"
pkgver=v3.0_rc1.r1114.g8230d9362
pkgrel=1
epoch=2
pkgdesc="A Bible study application based on the Sword library and Qt toolkit."
arch=('x86_64' 'i686')
url="https://bibletime.info/"
license=('GPL2')
depends=('sword>=1.8.1' 'qt5-webengine>=5.15')
makedepends=('git' 'po4a' 'docbook-xsl' 'docbook-xml' 'fop' 'clucene>=2.0' 'cmake>=3.10')
provides=('bibletime')
conflicts=('bibletime')
source=("git+https://github.com/bibletime/bibletime.git")

md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	_xslstylespath="/usr/share/xml/docbook/xsl-stylesheets-"$(pacman -Q docbook-xsl | cut -d ' ' -f 2 | cut -d '-' -f 1)
	mkdir -p "$srcdir/$_gitname/build_dir"
	cd "$srcdir/$_gitname/build_dir"

	sed -i 's/@BT_VERSION_FULL@//g' ../cmake/platforms/linux/bibletime.desktop.cmake

	CXXFLAGS+=" -fpermissive"
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DBUILD_HANDBOOK_HTML=ON \
	      -DBUILD_HANDBOOK_PDF=ON \
	      -DBUILD_HOWTO_HTML=ON \
	      -DBUILD_HOWTO_PDF=ON \
	      -DBT_DOCBOOK_XSL_HTML_CHUNK_XSL=$_xslstylespath/html/chunk.xsl \
	      -DBT_DOCBOOK_XSL_PDF_DOCBOOK_XSL=$_xslstylespath/fo/docbook.xsl \
	      ..
	make
}

package() {
	cd "$srcdir/$_gitname/build_dir"
	make DESTDIR="$pkgdir" install
}
