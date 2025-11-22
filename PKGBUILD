# Contributor: Swift Geek
# Maintainer: Walter Casanova - "Y29udGFjdG9Ad2FsdGVyY2FzYW5vdmEudGVjaAo="
# indent = tab
# tab-size = 4

pkgname=seamly2d-git
_pkgname=Seamly2D
pkgver=v0.6.0.1.r2186.g94c2a386b9
pkgrel=1
pkgdesc="Open source patternmaking software to democratize fashion"
arch=('i686' 'x86_64')
url="https://seamly.net"
license=('GPL3')
depends=('qt6-svg' 'poppler' 'desktop-file-utils' 'shared-mime-info' 'qt6-5compat')
makedepends=('git' 'qt6-tools')
source=(
	"git+https://github.com/FashionFreedom/Seamly2D.git#branch=develop"
	"seamly2d.xml"
	"seamlyme.xml"
)
b2sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build
	cd build
	export QT_SELECT=6
	qmake6 PREFIX=/usr PREFIX_LIB=/usr/lib ../Seamly2D.pro -r \
		CONFIG+=noDebugSymbols CONFIG+=no_ccache CONFIG+=noTests CONFIG+=noRunPath
	make
}

package() {
	cd "$srcdir/$_pkgname/build"
	make INSTALL_ROOT="$pkgdir/" install

	# MIME TYPES

	install -Dm644 "$srcdir/seamly2d.xml" \
		"$pkgdir/usr/share/mime/packages/seamly2d.xml"

	install -Dm644 "$srcdir/seamlyme.xml" \
		"$pkgdir/usr/share/mime/packages/seamlyme.xml"

	# MIME ICONS

	install -Dm644 "$pkgdir/usr/share/pixmaps/application-x-seamly2d-2d_file.png" \
		"$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/application-x-seamly2d-2d_file.png"

	install -Dm644 "$pkgdir/usr/share/pixmaps/application-x-seamlyme-individual_size_file.png" \
		"$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/application-x-seamlyme-individual_size_file.png"

	install -Dm644 "$pkgdir/usr/share/pixmaps/application-x-seamlyme-multi_size_file.png" \
		"$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/application-x-seamlyme-multi_size_file.png"
}
