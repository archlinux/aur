# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-git
pkgver=2.27.r0.g3e61a94
pkgrel=2
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API (git version)"
url="http://www.gog.com/en/forum/general/lgogdownloader_gogdownloader_for_linux"
arch=(i686 x86_64)
license=(WTFPL)
makedepends=('help2man' 'cmake' 'git')
provides=('lgogdownloader')
conflicts=('lgogdownloader')
_gitname="lgogdownloader"

# lgogdownloader has a new experimental aria2 feature available
# set _aria2 to "yes" to enable it
# For more details see https://www.gog.com/forum/general/lgogdownloader_gogdownloader_for_linux/post744
# Your mileage may vary -- It probably doesn't work
_aria2="no"

if [ "$_aria2" == "no" ]; then
	depends=('boost' 'jsoncpp<=1.6.5' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
	source=('git://github.com/Sude-/lgogdownloader.git')
	sha256sums=('SKIP')
elif [ "$_aria2" == "yes" ]; then

	depends=('boost' 'jsoncpp<=1.6.5' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'aria2')
	source=(
		'git://github.com/Sude-/lgogdownloader.git' 
		'https://sites.google.com/site/gogdownloader/use_aria2.diff'
	)
	sha256sums=(
		'SKIP' 
		'539748573dfde781d29a1fed6bf7f0815353d8e93f1988a73ef9cd13459720ff'
	)
else
	error "$_aria2: Invalid option for _aria2 switch in PKGBUILD."
	return 1
fi

pkgver() {
	cd $srcdir/${_gitname}
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

# Possible options for -DCMAKE_BUILD_TYPE are Release and Debug
# Debug has console spew

if [ "$_aria2" == "no" ]; then
	cd build
 	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
fi

if [ "$_aria2" == "yes" ]; then
	cp $srcdir/use_aria2.diff $srcdir/${_gitname}
	patch -p1 < use_aria2.diff
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DWITH_ARIA2=1 -DCMAKE_BUILD_TYPE=Release
fi
}

build() {
	cd $srcdir/${_gitname}/build

	make
}

package() {
	cd $srcdir/${_gitname}/build
	
	make DESTDIR=$pkgdir install
}
