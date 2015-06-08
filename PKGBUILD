# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=commander-zod
_version=2011_09_06
pkgver=0.$_version
pkgrel=2
pkgdesc="The Zod Engine - An Open Source Remake of the 1996 Game Z by Bitmap Brothers"
depends=("sdl" "sdl_mixer" "sdl_ttf" "sdl_image" "libmariadbclient" "wxgtk2.8")
arch=('i686' 'x86_64')
license=('GPL')
url="http://zod.sourceforge.net/"
source=("http://sourceforge.net/projects/zod/files/linux_releases/zod_linux-${_version//_/-}.tar.gz"
	"commander-zod.desktop"
	"commander-zod"
	"zod_launcher_wxgtk2.8.patch")
md5sums=('ab366b279e43add48d66e3d8224cfafa'
         '51949abec46c79b9871fedc99d88f4bd'
	 '76d5a47d6985756fe311d2ce02a3355b'
	 'e43e25604bf35e33f427ff3678f8c2ac')

build() {
	cd $srcdir
	patch -p0 < zod_launcher_wxgtk2.8.patch
	make -C $srcdir/zod_engine/zod_src
	make -C $srcdir/zod_engine/zod_src map_editor
	make -C $srcdir/zod_engine/zod_launcher_src
	mv $srcdir/zod_engine/zod_src/zod $srcdir/zod_engine
	mv $srcdir/zod_engine/zod_src/zod_map_editor $srcdir/zod_engine
	mv $srcdir/zod_engine/zod_launcher_src/zod_launcher $srcdir/zod_engine
	rm -r -f $srcdir/zod_engine/zod_src
	rm -r -f $srcdir/zod_engine/zod_launcher_src
}

package() {
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications/
	mv $srcdir/zod_engine $pkgdir/usr/lib/commander-zod
	install -m755 $srcdir/commander-zod $pkgdir/usr/bin/
	install -m644 $srcdir/commander-zod.desktop $pkgdir/usr/share/applications/
}
