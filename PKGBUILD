# Maintainer: rouhannb <rouhannb at gmail dot com> 
pkgname=sprite-sheet-packer-git
pkgver=1.0.9.r19.g6fc0ee6
pkgrel=1
pkgdesc='Sprite sheet packer not unlike TexturePacker'
arch=('x86_64')
url='https://github.com/amakaseev/sprite-sheet-packer/'
license=('MIT')
depends=('qt5-declarative')
makedepends=('git' 'gendesk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/amakaseev/sprite-sheet-packer.git')
md5sums=('SKIP')

# Gendesk info
_name='SpriteSheet Packer'
_exec='SpriteSheetPacker'
_categories='Development;Graphics;2DGraphics;RasterGraphics;Qt'

prepare() {
	gendesk -f -n
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/${pkgname%-git}/SpriteSheetPacker"
	qmake
	sed -i '\:SpriteSheetPacker/../install/linux/bin/SpriteSheetPacker$:d' Makefile
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -t "$pkgdir/usr/lib" "SpriteSheetPacker/3rdparty/PVRTexTool/Linux_$CARCH/libPVRTexLib.so"
	install -D -t "$pkgdir/usr/bin" 'install/linux/bin/SpriteSheetPacker'
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/${pkgname%-git}.desktop"
	install -Dm644 'SpriteSheetPacker/res/icon.png' "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
