# Maintainer: robertfoster

pkgbase=iortcw-git
pkgname=iortcw-git
pkgver=1.51c.r14.ga56038c7
pkgrel=1
pkgdesc="Merge of ioquake3 features and fixes into Return to Castle Wolfenstein"
arch=('i686' 'x86_64')
url="https://github.com/iortcw/iortcw"
license=('GPL')
depends=('iortcw-data' 'freetype2' 'sdl2' 'openal' 'opus' 'opusfile' 'libogg' 'zlib')
conflicts=('iortcw-svn')
replaces=('iortcw-svn')
makedepends=('cmake' 'git')
optdepends=(
	"iortcw-de: Deutsch Language"
	"iortcw-es: Espanol  Language"
	"iortcw-fr: Francais Language"
	"iortcw-it: Italian Language"
)
install='iortcw-git.install'
source=("git+https://github.com/iortcw/iortcw.git"
	'iortcw-ded.launcher'
	'iortcw-sp.launcher'
	'iortcw-mp.launcher'
	'iortcw-sp.desktop'
	'iortcw-mp.desktop'
	'openurl.sh'
)

pkgver() {
	cd "$srcdir/iortcw"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {

	cd "$srcdir/iortcw"

	cd SP
	make USE_INTERNAL_LIBS=0 \
		COPYDIR=$pkgdir/opt/iortcw/ copyfiles

	cd ../MP
	make USE_INTERNAL_LIBS=0 \
		COPYDIR=$pkgdir/opt/iortcw/ copyfiles

	ln -s -r /opt/iortcw-data/* $pkgdir/opt/iortcw/main

	# Modify Launcher Scripts
	if [ "$CARCH" = "x86_64" ]; then

		# x86_64 Systems
		TARGET=x86_64
	else
		# i686 Systems
		TARGET=x86
	fi

	sed -i "s:ARCH:$TARGET:" \
		$srcdir/iortcw-sp.*
	sed -i "s:ARCH:$TARGET:" \
		$srcdir/iortcw-mp.*
	sed -i "s:ARCH:$TARGET:" \
		$srcdir/iortcw-ded.*

	# Install Launcher Script (Single Player Client)
	install -D -m 755 $srcdir/iortcw-sp.launcher \
		$pkgdir/usr/bin/iortcw-sp

	# Install Launcher Script (Multi Player Client)
	install -D -m 755 $srcdir/iortcw-mp.launcher \
		$pkgdir/usr/bin/iortcw-mp

	# Install Launcher Script (Dedicated Server)
	install -D -m 755 $srcdir/iortcw-ded.launcher \
		$pkgdir/usr/bin/iortcw-ded

	# Install Desktop File (Single Player)
	install -D -m 644 $srcdir/iortcw-sp.desktop \
		$pkgdir/usr/share/applications/iortcw-sp.desktop

	# Install Desktop File (Multi Player)
	install -D -m 644 $srcdir/iortcw-mp.desktop \
		$pkgdir/usr/share/applications/iortcw-mp.desktop

	# Install Icon File (Single Player)
	install -D -m 644 $srcdir/iortcw/SP/misc/iortcw.svg \
		$pkgdir/usr/share/icons/hicolor/scalable/apps/iortcw.svg

	# Install openurl.sh script
	install -D -m 755 $srcdir/openurl.sh $pkgdir/opt/iortcw/openurl.sh
}

md5sums=('SKIP'
	'1cb1d7fda29d223a57003d097a1a4a31'
	'e400094c42766cb2b130d4d95bbe1caf'
	'bbc343567fa9a2f0101bdbd07cc9d32a'
	'dec8be9edbe233c8e69320a35acf9b01'
	'37889e4c81f20b1dd0b6cf25e1dd6b2c'
'11a60b83bcfb4b953344db248d886000')
