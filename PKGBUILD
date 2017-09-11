# Maintainer: manolollr <manolollr at riseup dot net>

pkgname='raceintospace-git'
pkgver=r455.e0d423d
pkgrel=1
pkgdesc='The computer version of the Liftoff! board game by Fritz Bronner'
arch=('i686' 'x86_64')
url='http://www.raceintospace.org/'
license=('GPL2')
depends=('sdl' 'libvorbis' 'libtheora' 'libpng' 'jsoncpp')
makedepends=('git' 'cmake' 'boost' 'protobuf' 'clang')
provides=('raceintospace')
conflicts=('raceintospace')
source=("$pkgname::git+https://github.com/raceintospace/raceintospace")
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $pkgname

	# Delete jsoncpp route in some .h files
	# The repository is prepared to compile using Debian package libjsoncpp-dev
	# In Debian package route is /usr/include/jsoncpp/json/*
	# But in Arch Linux package route is /usr/include/json/*

	grep -rl jsoncpp src/game/* | xargs sed -i 's/jsoncpp\///g'
}

build() {
	cd $pkgname
	mkdir raceintospace-build; cd raceintospace-build
	export CXX=clang++ ; export CC=clang
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package()
{
	cd $pkgname/raceintospace-build
	make DESTDIR=$pkgdir install
}
