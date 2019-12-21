# Maintainer: johnnybash <jb at wachenzell dot org> PGP 0xd126e2910543de2d
# Contributor: Alex Talker <alextalker at openmailbox dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Alexander Suhoverhov <cy at ngs dot ru>
# Contributor: Jookia <166291@gmail.com>
pkgname=xonotic-autobuild
pkgver=0.8.2.r3292.g0f459e8
pkgrel=1
pkgdesc="A free, fast-paced crossplatform first-person shooter"
arch=('x86_64')
url="http://xonotic.org"
license=('GPL')
depends=('alsa-lib' 'curl' 'libmodplug' 'libvorbis' 'libxpm'
         'sdl2' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('mesa' 'rsync')
conflicts=('xonotic' 'xonotic-data' 'xonotic-git')

#source=("http://dl.xonotic.org/xonotic-${pkgver}.zip")
#sha256sums=('a22f7230f486c5825b55cfdadd73399c9b0fae98c9e081dd8ac76eca08359ad5')

prepare() {

	excludes=
	excludes="$excludes --exclude=*.exe"
	excludes="$excludes --exclude=/gmqcc/*.exe"
	excludes="$excludes --exclude=/bin32"
	excludes="$excludes --exclude=*.dll"
	excludes="$excludes --exclude=/bin64"
	excludes="$excludes --exclude=/Xonotic*.app"
	excludes="$excludes --exclude=/xonotic-osx-*"
	excludes="$excludes --exclude=/gmqcc/gmqcc.osx"
	excludes="$excludes --exclude=/xonotic-linux32-*"
	excludes="$excludes --exclude=/gmqcc/gmqcc.linux32"
	
	rsync -c -r -P --delete-excluded --links $excludes rsync://beta.xonotic.org/autobuild-Xonotic $srcdir/Xonotic/
}

build() {

	# compile engine
	make -C $srcdir/Xonotic/source/darkplaces CPUOPTIMIZATIONS="${CFLAGS}" DP_FS_BASEDIR=/usr/share/xonotic/ DP_LINK_TO_LIBJPEG=1 sdl-release
	make -C $srcdir/Xonotic/source/darkplaces CPUOPTIMIZATIONS="${CFLAGS}" DP_FS_BASEDIR=/usr/share/xonotic/ DP_LINK_TO_LIBJPEG=1 sv-release

	cd $srcdir/Xonotic/source/d0_blind_id
	sh autogen.sh
	./configure --prefix=/usr --disable-rijndael
	make
}

pkgver() {
	ls $srcdir/Xonotic/source/qcsrc/csprogs-xonotic-* | sed 's/[^v]*[^-]//;s/-/.r/;s/-/./;s/~.*//'
}

package() {
	
	cd $srcdir/Xonotic

	mkdir -p $pkgdir/usr/share/xonotic/
	cp -r data $pkgdir/usr/share/xonotic/
	cp -r server $pkgdir/usr/share/xonotic/

	# binaries
	install -Dm755 source/darkplaces/darkplaces-dedicated $pkgdir/usr/bin/xonotic-dedicated
	install -Dm755 source/darkplaces/darkplaces-sdl $pkgdir/usr/bin/xonotic-sdl

	# convenience files
	install -Dm644 misc/logos/xonotic.desktop -t $pkgdir/usr/share/applications
  	
	for size in 16 22 24 32 48 64 128 256 512; do
		install -Dm644 misc/logos/icons_png/xonotic_${size}.png \
		"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/xonotic.png"
	done
	
	# key
	install -Dm644 key_0.d0pk $pkgdir/usr/share/xonotic/key_0.d0pk
  	
	# crypto stuff
	cd source/d0_blind_id
	make DESTDIR=$pkgdir install
}

# vim: ts=2:sw=2 et:
