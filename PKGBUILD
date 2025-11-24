pkgname=smpeg0
pkgver=0.4.5
pkgrel=2
pkgdesc="SDL MPEG Player Library - Legacy version 0.4.5"
arch=($CARCH)
url=https://icculus.org/smpeg/
license=(LGPL-2.0-only)
makedepends=(subversion)
depends=(gcc-libs glibc glu libglvnd libx11 libxau libxcb libxdmcp "sdl>=1:1" "sdl<1:2" ) # sdl12-compat
source=("$pkgname-$pkgver::svn://svn.icculus.org/smpeg/tags/release_${pkgver//./_}")
sha256sums=(SKIP)

prepare(){

	# time machine
	# env CXXFLAGS= does not work
	# sh ./configure CXXFLAGS= does not work
	export CC=" gcc -std=c11 "
	export CXX=" g++ -std=c++11 -Wno-narrowing "

	# configure
	cd $pkgname-$pkgver
	./autogen.sh
	C=(
	 ./configure
	 --prefix=/usr
	 --disable-gtk-player
	 --disable-gtktest
	 --enable-opengl-player
	 --with-x
	 CC="$CC"
	 CXX="$CXX"
	)
	"${C[@]}"

}

build() {
	cd $pkgname-$pkgver
	make
}

package(){

	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install

	cd "$pkgdir"/usr/share/man
	rm man1/gtv.1
	cd -

}
