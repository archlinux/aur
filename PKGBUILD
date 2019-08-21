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
)

pkgver() {
	cd "$srcdir/iortcw"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_iortcw-git() {

	cd "$srcdir/iortcw"

	cd SP
	make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/iortcw/ copyfiles
	cd ../MP
	make USE_INTERNAL_LIBS=0 COPYDIR=$pkgdir/opt/iortcw/ copyfiles

	ln -s -r /opt/iortcw-data/* $pkgdir/opt/iortcw/main

	# Modify Launcher Scripts
	if [ "$CARCH" = "x86_64" ]; then
		#
		# x86_64 Systems
		#
		sed -i "s:ARCH:x86_64:" \
			$srcdir/iortcw-sp.launcher
		sed -i "s:ARCH:x86_64:" \
			$srcdir/iortcw-mp.launcher
		sed -i "s:ARCH:x86_64:" \
			$srcdir/iortcw-ded.launcher
	else
		#
		# i686 Systems
		#
		sed -i "s:ARCH:x86:" \
			$srcdir/iortcw-sp.launcher
		sed -i "s:ARCH:x86:" \
			$srcdir/iortcw-mp.launcher
		sed -i "s:ARCH:x86:" \
			$srcdir/iortcw-ded.launcher
	fi

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
}

md5sums=('SKIP'
	'1cb1d7fda29d223a57003d097a1a4a31'
	'e400094c42766cb2b130d4d95bbe1caf'
	'bbc343567fa9a2f0101bdbd07cc9d32a'
	'5d91a81acdc289688ce9a8b3fef2d382'
'7dd75064074886092fa9b3fc77a847b6')
