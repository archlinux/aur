# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
# Contributor: Alex Talker <alextalker at openmailbox dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Alexander Suhoverhov <cy at ngs dot ru>
# Contributor: Jookia <166291@gmail.com>
pkgname=xonotic-autobuild
pkgver=0.8.5
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
sha512sums=('ce79ffabd76c83cfe097f56fa47d694c368a59a7e216ce9d0ac30523515a1804bac03de6080e561835b3d5f500dcc05b5c4ff38b3713a7fca7d41b35068b790b')
b2sums=('efd724c0c9385ebf91f78eff95977915ce2c62c76d3b08e2acacdf7d1ebd12647ea6a715d91b2085e2e50b7cf5c2aed2e8c5bdd1829f78677699e112dfa36686')

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
