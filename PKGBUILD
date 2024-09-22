# Maintainer: autumnontape <autumn at cyfox dot net>
# Contributor: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: Rene Wiermer <rwiermer@googlemail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgbase=qtads
pkgname=(qtads qtads-mimetype-icons)
pkgver=3.4.0
pkgrel=1
url="https://realnc.github.io/qtads/"
license=('GPL-3.0-or-later')
pkgdesc="interpreter for TADS games (compatible with TADS 2 and 3, multimedia and text)"
arch=('i686' 'x86_64')
depends=('qt5-base' 'sdl2' 'fluidsynth' 'mpg123' 'libvorbis' 'hicolor-icon-theme' 'libsndfile')
optdepends=('qtads-mimetype-icons: desktop icons for TADS 2 and 3 story files')
source=(
	"https://github.com/realnc/qtads/releases/download/v${pkgver}/qtads-${pkgver}-source.tar.xz"
	'auto-update-never-by-default.patch'
)
sha256sums=(
	'3c8f1b47ee42d89753d68e7c804ca3677b0c89a5d765d1fd4f80f9cdc29d3473'
	'6876958ccb023f3b62789d69fe6dd4d021f5f1aefd3eb5dc372e8b42c8b030e7'
)


prepare() {
	cd "$srcdir/qtads-$pkgver"

	patch -Np1 -i "${srcdir}/auto-update-never-by-default.patch"
}

build() {
	cd "$srcdir/qtads-$pkgver"

	qmake PREFIX=/usr
	make
}

package_qtads() {
	cd "$srcdir/qtads-$pkgver"

	make install INSTALL_ROOT="${pkgdir}"

	rm -r "${pkgdir}/usr/share/icons/hicolor/16x16" \
		"${pkgdir}/usr/share/icons/hicolor/32x32" \
		"${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes" \
		"${pkgdir}/usr/share/icons/hicolor/128x128"
}

package_qtads-mimetype-icons() {
	pkgdesc="QTads's desktop icons for TADS 2 and 3 story files"
	arch=('any')
	# list qtads as a dependency because our icons won't be used
	# without /usr/share/mime/packages/qtads.xml installed, and
	# so people don't uninstall the qtads package and forget to
	# uninstall this one
	depends=('qtads' 'hicolor-icon-theme')
	optdepends=()
	conflicts=('gargoyle' 'gargoyle-git')

	local tmpinstall="${pkgdir}/tmpinstall"
	mkdir "${tmpinstall}"

	cd "$srcdir/qtads-$pkgver"
	make install INSTALL_ROOT="${tmpinstall}"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor/48x48"

	mv "${tmpinstall}/usr/share/icons/hicolor/16x16" \
		"${tmpinstall}/usr/share/icons/hicolor/32x32" \
		"${tmpinstall}/usr/share/icons/hicolor/128x128" \
		"${pkgdir}/usr/share/icons/hicolor/"

	mv "${tmpinstall}/usr/share/icons/hicolor/48x48/mimetypes" \
		"${pkgdir}/usr/share/icons/hicolor/48x48/"

	rm -rf "${tmpinstall}"
}
