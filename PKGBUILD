# Maintainer : Xylemon <xylemon@vera-visions.com>
# Contributor : Zachary Freed <theconfuzzleddude@gmail.com>
# Contributor : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=ftequake
pkgver=20231031
gitver=eb6b127d9ce10949f00bcad8c5953b7092c92d12
pkgrel=2
pkgdesc="FTE QuakeWorld, idTech engine for Quake 1, 2, 3 and Hexen 2"
arch=('i686' 'x86_64')
url="https://fteqw.org"
license=('GPL-2.0-or-later')
makedepends=('make' 'gcc' 'zip' 'automake' 'autoconf')
depends=('libpng' 'sdl2' 'libjpeg-turbo' 'speex' 'opus'
	     'libogg' 'libpng' 'libvorbis' 'zlib' 'mesa' 'freetype2' 'ffmpeg4.4')
conflicts=('ftequake-svn' 'ftequake-git' 'fteqw-svn' 'fteqw-git')
provides=('ftequake')
source=("https://github.com/fte-team/fteqw/archive/$gitver.zip"
	'info.triptohell.fteqw.png'
	'sdl2-fix.patch') 
sha512sums=('f92d378e18eab08817900f5bdf0c5383769902fc27f4b54f9e499fa0d5c3110e5a09a10d46dc8e43fc7a609007cf80fdd5b2d633151a106206dca79091fe38f8'
	'4dd799d4efe3975e27e021b9203d4065242473e5e340ec7a001c17d4a98e605df3269cf562551c801ce69306488a7fca8f1af29984afc5bebc7599beb7255221'
	'f1bcda743e31d0d7cdbf12bbfa54f43ac975f01d0989fba7b091c3f00e298e42b315522692f7ec9b12e7112c33029030fc866402dc24fa8e94618c7e93d3bad5')
build() {

	cd "$srcdir/fteqw-$gitver/engine"

	patch -p0 < "$srcdir/sdl2-fix.patch"

	make m-rel FTE_TARGET=SDL2 CFLAGS="-DFTE_LIBRARY_PATH=/usr/lib/fteqw"

	make plugins-rel NATIVE_PLUGINS="ezhud ffmpeg hl2 quake3" AV_BASE=/usr/include/ffmpeg4.4/ AV_LDFLAGS="-l:libavcodec.so.58 -l:libavformat.so.58 -l:libavutil.so.56 -l:libswscale.so.5"

}

package() {
 
	cd "$srcdir/fteqw-$gitver/engine/release"

	install -Dm755 fteqw-sdl2 "$pkgdir/usr/bin/fteqw"
	install -Dm755 fteplug_ezhud_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_ezhud_amd64.so"
	install -Dm755 fteplug_ffmpeg_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_ffmpeg_amd64.so"
	install -Dm755 fteplug_hl2_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_hl2_amd64.so"
	install -Dm755 fteplug_quake3_amd64.so "$pkgdir/usr/lib/fteqw/fteplug_quake3_amd64.so"

	cd "$srcdir/fteqw-$gitver"

	install -Dm644 fteqw.desktop "$pkgdir/usr/share/applications/fteqw.desktop"

	install -Dm644 "$startdir/info.triptohell.fteqw.png" "$pkgdir/usr/share/pixmaps/info.triptohell.fteqw.png"


}
