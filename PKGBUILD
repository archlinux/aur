# Maintainer: Bink
pkgname=spriteglypher
pkgver=1.0.6
pkgrel=1
pkgdesc="Desktop bitmap font editor with layered effects and PNG atlas export"
arch=('x86_64')
url="https://github.com/Fluocode/SpriteGlypher"
license=('GPL-3.0-only' 'MIT')
depends=('qt6-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Fluocode/SpriteGlypher/archive/a02029b957ad8dacceda787e1987a1986a9a6836.tar.gz")
b2sums=('104f0019e61aa33f50c0a51b5991066794aa8f81f64d110455f16ed07ffeb10fc7529f7e8bcc9edb991ec315979aa862cdc32a4c82cc1e8376ff2c15a9f72096')

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
