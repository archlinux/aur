# Maintainer: rouhannb <rouhannb@gmail.com> 
pkgname=sprite-sheet-packer-git
pkgver=1.0.9.r24.g14bb0e9
pkgrel=2
pkgdesc='Sprite sheet packer not unlike TexturePacker'
arch=('x86_64')
url='https://github.com/amakaseev/sprite-sheet-packer/'
license=('MIT')
depends=('qt5-declarative')
makedepends=('git' 'gendesk' 'patchelf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/amakaseev/sprite-sheet-packer.git')
md5sums=('SKIP')

# Gendesk info
_name='SpriteSheet Packer'
_exec='spritesheetpacker'
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
    patchelf --set-rpath '$ORIGIN/lib' '../install/linux/bin/SpriteSheetPacker'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt "$pkgdir/opt/${pkgname%-git}/lib" \
        "SpriteSheetPacker/3rdparty/PVRTexTool/Linux_$CARCH/libPVRTexLib.so"
	install 'install/linux/bin/SpriteSheetPacker' "$pkgdir/opt/${pkgname%-git}"
    install -d "$pkgdir/usr/bin"
    ln -s "../../opt/${pkgname%-git}/SpriteSheetPacker" "$pkgdir/usr/bin/spritesheetpacker"
    cp -r "SpriteSheetPacker/defaultFormats" "$pkgdir/opt/${pkgname%-git}"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/${pkgname%-git}.desktop"
	install -Dm644 'SpriteSheetPacker/res/icon.png' "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
