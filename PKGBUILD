# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
# Contributor: Alex Talker <alextalker at openmailbox dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Alexander Suhoverhov <cy at ngs dot ru>
# Contributor: Jookia <166291@gmail.com>
pkgname=xonotic-autobuild
pkgver=20230307
pkgrel=1
pkgdesc="A free, fast-paced crossplatform first-person shooter"
arch=('x86_64' 'aarch64')
url="http://xonotic.org"
license=('GPL')
depends=('alsa-lib' 'curl' 'libmodplug' 'libvorbis' 'libxpm'
         'sdl2' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('mesa' 'rsync')
conflicts=('xonotic' 'xonotic-data' 'xonotic-git')

source=("rsync://beta.xonotic.org/autobuild-Xonotic/misc/tools/rsync-updater/update-to-autobuild.sh")
sha512sums=('2249d824f023ac4910eb44556f9dd8ff641267e8bc1e3eaa1e61b9c4a5a7ad7d1cc1d42449501f16292d1157e15a6bb12be7d468999469dd70e15992c4821aee')
b2sums=('9b55f34fb9749d2aec4bcd08dc90a8443927c18740a8affba73360d45df3f0ed22308aaa357c474b7874731a986353ebd5738973fe0465173d4244ad8af7616d')

pkgver() {
  printf $(date +%Y%m%d)
}

prepare() {
  echo Y | sh ./update-to-autobuild.sh
}

build() {

	# compile engine
	make -C $srcdir/Xonotic/source/darkplaces CPUOPTIMIZATIONS="${CFLAGS}" DP_FS_BASEDIR=/usr/share/xonotic/ DP_LINK_TO_LIBJPEG=1 sdl-release
	make -C $srcdir/Xonotic/source/darkplaces CPUOPTIMIZATIONS="${CFLAGS}" DP_FS_BASEDIR=/usr/share/xonotic/ DP_LINK_TO_LIBJPEG=1 sv-release

	cd $srcdir/Xonotic/source/d0_blind_id
	sh autogen.sh
	./configure --prefix=/usr
	make
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
