# Maintainer: yuri_k7 <riyu12383@gmail.com>
# Co-Maintainer Darren Ng <`base64 -d <<<aGMwbWV1QG5hdmVyLmNvbQo=`>

# https://gitlab.archlinux.org/archlinux/packaging/packages/smpeg/-/blob/e9366f6f4b4026368b9cbc651d694d138437b9ea/PKGBUILD
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=smpeg0
pkgver=0.4.5
pkgrel=8
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
	export CFLAGS="$CFLAGS -std=c11"
	export CXXFLAGS="$CXXFLAGS -std=c++11 -Wno-error=narrowing"
	sed Makefile -i -e "/^CPPFLAGS/ s|$| $CPPFLAGS |g" # preprocessor
	sed Makefile -i -e "/^CFLAGS/   s|$| $CFLAGS   |g"
	sed Makefile -i -e "/^CXXFLAGS/ s|$| $CXXFLAGS |g"
	sed Makefile -i -e "/^LDFLAGS/  s|$| $LDFLAGS  |g"

	# smpeg0 /usr/bin/plaympeg in conflict with smpeg
	sed plaympeg.1 -i -e "s/plaympeg/plaympeg0/g" -e "s/PLAYMPEG/PLAYMPEG0/g"

}

build() {
	make -C $pkgname-$pkgver
}

package(){

	make -C $pkgname-$pkgver DESTDIR="$pkgdir" install

	cd "$pkgdir"/usr
	mv bin/plaympeg{,0}

	cd share/man/man1
	rm gtv.1
	#sh
	mv plaympeg{,0}.1

}

# vim: set ai nosi noet ts=2 sts=2 sw=2:
