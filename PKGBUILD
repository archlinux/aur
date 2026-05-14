# Maintainer: Bink
pkgname=spriteglypher
pkgver=1.0.6
pkgrel=3
pkgdesc="Desktop bitmap font editor with layered effects and PNG atlas export"
arch=('x86_64')
url="https://github.com/Fluocode/SpriteGlypher"
license=('GPL-3.0-only' 'MIT')
depends=('qt6-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Fluocode/SpriteGlypher/archive/5280cf4db2b0a5226aa319763f0fd9e5a32ffe85.tar.gz")
b2sums=('fc2b97bf1084d508d1efc8e4f549cdd7d439a3a4f41e47760727a427f2838949ed8dccc1d21233b726a39eb4f1d579dd84d264e60e87559b7394fb848c2f3f33')

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
