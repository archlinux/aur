# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=darkplaces-server
pkgver=20140513
pkgrel=1
pkgdesc="An advanced Quake 1 game engine, server only for headless environments"
arch=('i686' 'x86_64')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=()
makedepends=()
install=$pkgname.install
source=(http://icculus.org/twilight/darkplaces/files/darkplacesengine$pkgver.zip)
sha256sums=('69e5a50991884196e403bd6aab4a33bba553a934a167be366672ab4e223b06c9')


build() {
	# Extract the package
	cd $srcdir
	bsdtar -xf darkplacesenginesource$pkgver.zip || return 1

	# Make sure Darkplaces is not compiled with -j > 1.
	MAKEFLAGS="${MAKEFLAGS} -j1"

	# Compile
	cd darkplaces
	sed -i -e '1i DP_LINK_TO_LIBJPEG=1' makefile
	make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/quake sv-release || return 1
}

package() {
	cd $srcdir/darkplaces

	# Install binary, icon and desktop files
	install -d $pkgdir/usr/{bin,share/quake}
	install -m 755 darkplaces-dedicated $pkgdir/usr/bin/
}
