# Maintainer: robertfoster

pkgbase=realrtcw
pkgname=('realrtcw' 'realrtcw-hdpack' 'realrtcw-splatterladder')
pkgver=3.0
pkgrel=2
pkgdesc="A mod that brings some realism to the classic Wolfenstein game. You can expect ruthless AI, new weapons and rebalanced gameplay"
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/realrtcw-realism-mod"
license=('GPL')
depends=('freetype2' 'graphite' 'harfbuzz' 'iortcw-data' 'libjpeg-turbo' 'libogg' 'openal' 'opus' 'opusfile' 'pcre' 'sdl2' 'zlib')
makedepends=('cmake' 'unzip' 'innoextract')
install='realrtcw.install'
source=("https://github.com/wolfetplayer/RealRTCW/archive/$pkgver.tar.gz"
	"https://wolffiles.de/filebase/RtCW/Mods/RealRTCW.zip"
	realrtcw.png
	realrtcw-sp.launcher
	realrtcw-sp.desktop
)

prepare() {
	cd $srcdir

	# Unzipping with flattened paths
	if [ ! -e setup.exe ]; then
		# Unzipping with flattened paths
		unzip -jo RealRTCW.zip -d $srcdir
	fi

	# Extracting InnoSetup
	if [ ! -d app ]; then
		innoextract setup.exe
	fi
}

package_realrtcw() {
	cd "$srcdir/RealRTCW-$pkgver"

	make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/realrtcw copyfiles

	ln -s -r /opt/iortcw-data/pak0.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/sp_pak1.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pak0.pk3 $pkgdir/opt/realrtcw/main

	ln -s -r /opt/iortcw-data/mp_bin.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pak1.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pak2.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pak3.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pak4.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pak5.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pakmaps0.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pakmaps1.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pakmaps2.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pakmaps3.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pakmaps4.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pakmaps5.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/mp_pakmaps6.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/sp_pak2.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/sp_pak3.pk3 $pkgdir/opt/realrtcw/main
	ln -s -r /opt/iortcw-data/sp_pak4.pk3 $pkgdir/opt/realrtcw/main

	ln -s -r /opt/iortcw-data/openurl.sh   $pkgdir/opt/realrtcw/openurl.sh

	# Installing RealRTCW pk3
	install -m 755 $srcdir/app/Main/z_realrtcw.pk3 \
		$pkgdir/opt/realrtcw/main

	install -m 755 $srcdir/app/Main/z_trainingday.pk3 \
		$pkgdir/opt/realrtcw/main

	for i in $(find ../app/ -type d -name "RealRTCW_*"); do
		cp -r $srcdir/app/$i $pkgdir/opt/realrtcw/
	done

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
	install -Dm 644 $srcdir/realrtcw.png \
		$pkgdir/usr/share/pixmaps/realrtcw.png
}

package_realrtcw-hdpack() {
	pkgdesc="RTCW Vanilla textures upscaled by AI. This is for those who prefer original style and atmosphere of the game."

	# Installing RealRTCW HD pack pk3
	install -D -m 755 $srcdir/app/Main/z_hdpack.pk3 \
		$pkgdir/opt/realrtcw/main/z_hdpack.pk3
}

package_realrtcw-splatterladder() {
	pkgdesc="Splatterladder RtCW HD Pack: an amazing pack with true HD textures made by WolfRTCW."
	conflicts=('realrtcw-hdpack')
	replaces=('realrtcw-hdpack')
	# Installing RealRTCW HD pack pk3
	install -D -m 755 $srcdir/app/Main/z_Sl_RtCWHD.pk3 \
		$pkgdir/opt/realrtcw/main/z_Sl_RtCWHD.pk3
}

md5sums=('a3eff16d3851e1bf5b391501afa4663e'
	'031b4228e632a8f31143bf38e8ea7394'
	'13fd3f1ac91dff9ef31d02158f9b58d9'
	'7e3991e5f331662419ad1ed04e49366c'
'5fcd49cca83f7bba0d75c6b4b5801f95')
