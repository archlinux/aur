# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-git
pkgver=20160120
pkgrel=1
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API (git version)"
url="http://www.gog.com/en/forum/general/lgogdownloader_gogdownloader_for_linux"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
makedepends=('help2man' 'cmake' 'git')
source=('git://github.com/Sude-/lgogdownloader.git')
md5sums=('SKIP')
provides=('lgogdownloader')
conflicts=('lgogdownloader')
_gitname="lgogdownloader"

pkgver() {
	git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd $srcdir/${_gitname}

# This is probably redundant since we flush repos before a rebuild,
# but we'll need it in the non-git version
# So it's here for self reference, mostly.
# Please direct complaints to /dev/null

	if [ ! -d "build" ]; then
		mkdir build
	else
		rm -rf build/*
	fi

	cd build
	
# Possible options for -DCMAKE_BUILD_TYPE are Release and Debug
# Debug has console spew

 	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

}

build() {
	cd $srcdir/${_gitname}/build

	make
}

package() {
	cd $srcdir/${_gitname}/build
	
	make DESTDIR=$pkgdir install
}
