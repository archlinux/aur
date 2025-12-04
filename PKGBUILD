# Maintainer: yuri_k7 <riyu12383@gmail.com>
# Co-Maintainer Darren Ng <`base64 -d <<<aGMwbWV1QG5hdmVyLmNvbQo=`>

# https://gitlab.archlinux.org/archlinux/packaging/packages/smpeg/-/blob/e9366f6f4b4026368b9cbc651d694d138437b9ea/PKGBUILD
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=smpeg0
pkgver=0.4.5
pkgrel=5
pkgdesc="SDL MPEG Player Library - Legacy version 0.4.5"
arch=($CARCH)
url=https://icculus.org/smpeg/
license=(LGPL-2.0-only)
makedepends=(subversion)
depends=(
	sh # smpeg-config
	"sdl>=1:1" "sdl<1:2" # provided by sdl12-compat over sdl2-compat over sdl3
	gcc-libs glibc glu libglvnd libx11 libxau libxcb libxdmcp
)
source=("$pkgname-$pkgver::svn://svn.icculus.org/smpeg/tags/release_${pkgver//./_}")
sha256sums=(SKIP)

prepare(){

	cd $pkgname-$pkgver

	# configure
	./autogen.sh
	local _C=(
	 ./configure
	 --prefix=/usr
	 --disable-gtk-player
	 --disable-gtktest
	 --enable-opengl-player
	 --with-x
	)
	"${_C[@]}"

	# configure script is broken
	# configure script ignores flags
	# manually append flags
	sed Makefile -i -e "/^CPPFLAGS/ s|$| $CPPFLAGS                                 |g" # preprocessor
	sed Makefile -i -e "/^CFLAGS/   s|$| $CFLAGS   -std=c11                        |g"
	sed Makefile -i -e "/^CXXFLAGS/ s|$| $CXXFLAGS -std=c++11 -Wno-error=narrowing |g"
	sed Makefile -i -e "/^LDFLAGS/  s|$| $LDFLAGS                                  |g"

}

build() {
	make -C $pkgname-$pkgver
}

package(){
	make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
	rm "$pkgdir"/usr/share/man/man1/gtv.1
}

# vim: set ai nosi noet ts=2 sts=2 sw=2:
