# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=darkplaces
pkgver=20140513
pkgrel=3
pkgdesc="An advanced Quake 1 game engine"
arch=('i686' 'x86_64')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=('alsa-lib' 'hicolor-icon-theme' 'libjpeg-turbo' 'libxpm'
         'libxxf86vm' 'sdl' 'zlib')
install=$pkgname.install
source=(http://icculus.org/twilight/$pkgname/files/darkplacesengine$pkgver.zip
        $pkgname.desktop)
sha512sums=('45864b590057c6de0ea978b3cc967feb879b87b2d376f3b4d8525e037b10ca1fc68599c152506494bb06669c6c2304e0aa0ee1b28f7a0d589d10c23f7285052c'
            'daed32cb397b8f5d8a569b0679680377b9a1fb7a30fc5b99742381723850b792424d221deafb48ed4bad99d9fc7812f8a667263d9f0e63a40fbc2d9e1013c1d6')
noextract=(darkplacesengine$pkgver.zip)

prepare() {
	cd "$srcdir"
	bsdtar -xf darkplacesengine$pkgver.zip darkplacesenginesource$pkgver.zip
	bsdtar -xf darkplacesenginesource$pkgver.zip
	cd "$pkgname"

	# Fix a couple options in the Makefile.
	sed -i '1i DP_LINK_TO_LIBJPEG=1' makefile
	sed -i '/(STRIP)/d' makefile.inc
}

build() {
	cd "$srcdir/$pkgname"

	make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/games/quake release
}

package() {
	cd $srcdir/$pkgname
	install -d $pkgdir/usr/bin
	install -m755 darkplaces-{dedicated,glx,sdl} $pkgdir/usr/bin

	for i in 16 24 32 48 64 72; do
		install -Dm644 darkplaces${i}x${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/darkplaces.png
	done

	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
