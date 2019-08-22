# Maintainer: robertfoster

pkgbase=realrtcw
pkgname=('realrtcw' 'realrtcw-hdpack')
pkgver=2.21
_hdpackver=2.2
pkgrel=2
pkgdesc="A mod that brings some realism to the classic Wolfenstein game. You can expect ruthless AI, new weapons and rebalanced gameplay"
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/realrtcw-realism-mod"
license=('GPL')
depends=('iortcw-data' 'freetype2' 'sdl2' 'openal' 'opus' 'opusfile' 'libogg' 'zlib')
makedepends=('cmake' 'unzip')
install='realrtcw.install'
source=("https://github.com/wolfetplayer/RealRTCW/archive/$pkgver.tar.gz"
	"https://wolffiles.de/filebase/RtCW/Mods/$pkgname$pkgver.zip"
	"http://www.wolfenstein-files.de/rtcw/mods/hdpack${_hdpackver}.zip"
	realrtcw-sp.launcher
	realrtcw-sp.desktop
)
noextract=("${pkgname[0]}$pkgver.zip" "hdpack${_hdpackver}.zip")

package_realrtcw() {
	cd "$srcdir/RealRTCW-$pkgver"

	make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/realrtcw/ copyfiles

	ln -s -r /opt/iortcw-data/*.pk3   $pkgdir/opt/realrtcw/main
        ln -s -r /opt/iortcw-data/openurl.sh   $pkgdir/opt/realrtcw/openurl.sh

	# Unzipping with flattened paths
	unzip -jo $srcdir/realrtcw$pkgver.zip -d $srcdir

	# Installing RealRTCW pk3
	install -m 755 $srcdir/z_realrtcw.pk3 \
		$pkgdir/opt/realrtcw/main

	# Modify Launcher Scripts
	if [ "$CARCH" = "x86_64" ]; then
		# x86_64 Systems
		TARGET=x86_64
	else
		# i686 Systems
		TARGET=x86
	fi
	sed -i "s:ARCH:$TARGET:" \
		$srcdir/realrtcw-sp.*

	# Install Launcher Script (Single Player Client)
	install -D -m 755 $srcdir/realrtcw-sp.launcher \
		$pkgdir/usr/bin/realrtcw-sp

	# Install Desktop File (Single Player)
	install -D -m 644 $srcdir/realrtcw-sp.desktop \
		$pkgdir/usr/share/applications/realrtcw-sp.desktop

	# Install Icon File (Single Player)
	install -Dm 644 misc/iortcw.svg \
		$pkgdir/usr/share/pixmaps/realrtcw.svg
}

package_realrtcw-hdpack() {
	pkgdesc="HD Textures for RealRTCW Mod"

	# Unzipping with flattened paths
	unzip -jo $srcdir/hdpack${_hdpackver}.zip -d $srcdir

	# Installing RealRTCW HD pack pk3
	install -D -m 755 $srcdir/z_hdpack.pk3 \
		$pkgdir/opt/realrtcw/main/z_hdpack.pk3
}

md5sums=('088b535c3bade4acf18a57df5b23b683'
	'eedef619c657f3465e448ae0968fe265'
	'800b2b4f9166a46198c093f9c6365bf3'
	'7e3991e5f331662419ad1ed04e49366c'
'5fcd49cca83f7bba0d75c6b4b5801f95')
