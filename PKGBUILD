# Maintainer: Bink
pkgname=spriteglypher
pkgver=1.0.6
pkgrel=2
pkgdesc="Desktop bitmap font editor with layered effects and PNG atlas export"
arch=('x86_64')
url="https://github.com/Fluocode/SpriteGlypher"
license=('GPL-3.0-only' 'MIT')
depends=('qt6-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Fluocode/SpriteGlypher/archive/5daeb71f6e973d0fb3712ad915fbc41040a4b02f.tar.gz")
b2sums=('0cafcd557c5915067cf8ca2dc03a5840a1fd77c8bd92f6bb819c0a413d23893684c2b8d40011a735d147f0d0a2dfbef8da338bd19701712142655c6be31ebb7e')

build() {
	cd "${srcdir}"/SpriteGlypher-*
	qmake6 SpriteGlypher.pro \
		CONFIG+=release \
		DESTDIR="${srcdir}/build" \
		OBJECTS_DIR="${srcdir}/.obj" \
		MOC_DIR="${srcdir}/.moc" \
		RCC_DIR="${srcdir}/.rcc" \
		UI_DIR="${srcdir}/.ui"
	make
}

package() {
	cd "${srcdir}"/SpriteGlypher-*

	# Install binary
	install -Dm755 "${srcdir}/build/SpriteGlypher" \
		"${pkgdir}/usr/bin/spriteglypher"

	# Install icon
	install -Dm644 icon.png \
		"${pkgdir}/usr/share/pixmaps/spriteglypher.png"

	# Install licenses
	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL3"
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.MIT"

	# Install MIME type definition for .sgf project files
	install -Dm644 /dev/stdin \
		"${pkgdir}/usr/share/mime/packages/spriteglypher.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-sgf">
    <comment>Sprite Glypher project</comment>
    <glob pattern="*.sgf"/>
    <icon name="spriteglypher"/>
  </mime-type>
</mime-info>
EOF

	# Install desktop entry
	install -Dm644 /dev/stdin \
		"${pkgdir}/usr/share/applications/spriteglypher.desktop" <<EOF
[Desktop Entry]
Name=Sprite Glypher
GenericName=Bitmap Font Editor
Comment=Desktop bitmap font editor for games and applications
Exec=spriteglypher %f
Icon=spriteglypher
Terminal=false
Type=Application
Categories=Graphics;2DGraphics;
MimeType=application/x-sgf;
Keywords=bitmap;font;sprite;game;atlas;
EOF
}
