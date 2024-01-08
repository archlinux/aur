# Maintainer: Josh Mandle <difarem@gmail.com>

pkgname=smw-git
pkgver=2
pkgrel=1
pkgdesc='Super Mario multiplayer game.'
url='http://smwstuff.net/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl' 'zlib')
makedepends=('git' 'cmake')
provides=('smw')
conflicts=('smw-bin')
source=('git+https://github.com/mmatyas/supermariowar.git')

sha256sums=('SKIP')

prepare() {
#	cp $srcdir/supermariowar
	cd -- "$srcdir/supermariowar"
	git submodule update --init
	[[ -d build ]] || mkdir build 
}

build() {
	cd -- "$srcdir/supermariowar/build/"
	cmake .. -DCMAKE_INSTALL_PREFIX:path="${pkgdir}/usr/" -DSMW_BINDIR:path="${pkgdir}/usr/bin" -DSMW_DATADIR:path="${pkgdir}/var/lib/smw" -DSMW_DOCDIR:path="${pkgdir}/usr/share/doc/smw/"
	make -j4 # -jN = build on N thread
}

package() {
	cd -- "$srcdir/supermariowar/build"
	make install
	sed -i 's/\(--datadir[[:space:]]\)[^[:space:]]*/\1\/var\/lib\/smw/' $pkgdir/usr/share/applications/supermariowar.desktop
	sed -i 's/\(--datadir[[:space:]]\)[^[:space:]]*/\1\/var\/lib\/smw/' $pkgdir/usr/share/applications/supermariowar-leveleditor.desktop
	sed -i 's/\(--datadir[[:space:]]\)[^[:space:]]*/\1\/var\/lib\/smw/' $pkgdir/usr/share/applications/supermariowar-worldeditor.desktop

}
