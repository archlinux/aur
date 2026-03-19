# Maintainer : Xylemon <xylemon@vera-visions.com>
# Contributor : Zachary Freed <theconfuzzleddude@gmail.com>
# Contributor : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=ftequake
pkgver=20250927
gitver=2025-09-27
pkgrel=1
pkgdesc="FTE QuakeWorld, idTech engine for Quake 1, 2, 3 and Hexen 2"
arch=('i686' 'x86_64')
url="https://fteqw.org"
license=('GPL-2.0-or-later')
makedepends=('make' 'patch' 'gcc' 'pkgconf' 'vulkan-headers'
			 'libtool' 'automake' 'autoconf' 'zip' 'wget')
depends=('libpng' 'sdl2' 'libjpeg-turbo' 'speex' 'opus' 'ffmpeg'
	     'libogg' 'libpng' 'libvorbis' 'zlib' 'mesa' 'freetype2')
conflicts=('ftequake-svn' 'ftequake-git' 'fteqw-svn' 'fteqw-git')
provides=('fteqw')
source=("https://github.com/fte-team/fteqw/archive/refs/tags/$gitver.tar.gz"
		'sdl2-fix.patch')
sha512sums=('cf76a900ba933928ae40ed25a2cb178f1b4ce0a2f646b421d2022dd889473654f5c647589d492846b76e361a218a94a11f7e3d5504fcdc4b01a4de4b76b26187'
			'57882a9bdbda886a65213208fea75f60ecfee725fe56938036d9eddf391e247d73c5b10b4900771f573d221479cbc903557e7633ac771483d6288ebaa8a672ac')
build() {

	cd "$srcdir/fteqw-$gitver/engine"

	patch -p1 < "$srcdir/sdl2-fix.patch"

	make m-rel FTE_TARGET=SDL2 CFLAGS="-DFTE_LIBRARY_PATH=/usr/lib/fteqw"

	make imgtool-rel

	make iqm-rel

	make plugins-rel NATIVE_PLUGINS="ezhud qi ffmpeg hl2 quake3 cod ode"

}

package() {
 
	cd "$srcdir/fteqw-$gitver/engine/release"

	install -Dm755 fteqw-sdl2 "$pkgdir/usr/bin/fteqw"
	install -Dm755 imgtool "$pkgdir/usr/bin/imgtool"
	install -Dm755 iqmtool "$pkgdir/usr/bin/iqmtool"

	install -Dm755 fteplug_ezhud_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_ezhud_amd64.so"
	install -Dm755 fteplug_qi_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_qi_amd64.so"
	install -Dm755 fteplug_ffmpeg_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_ffmpeg_amd64.so"
	install -Dm755 fteplug_hl2_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_hl2_amd64.so"
	install -Dm755 fteplug_quake3_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_quake3_amd64.so"
	install -Dm755 fteplug_cod_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_cod_amd64.so"
	install -Dm755 fteplug_ode_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_ode_amd64.so"

	cd "$srcdir/fteqw-$gitver"

	install -Dm644 "dist/linux/org.fteqw.fteqw.desktop" "$pkgdir/usr/share/applications/org.fteqw.fteqw.desktop"

	install -Dm644 "dist/org.fteqw.fteqw.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.fteqw.fteqw.svg"


}
