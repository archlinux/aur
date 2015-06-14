# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=gegl-seamless-clone-git
_pkgname=gegl-git
_branch=soc-2011-seamless-clone
pkgver=GEGL_0_2_0.925.gecc1061
pkgrel=1
pkgdesc="GEGL (Generic Graphics Library) is a graph based image processing framework - seamless-clone branch"
arch=('i686' 'x86_64')
url="http://www.gegl.org/"
license=('GPL')
conflicts=(gegl-git gegl)
provides=(gegl gegl-seamless-clone)
depends=(babl-git ruby libopenraw libspiro ffmpeg librsvg openexr)
makedepends=(git intltool)
options=(!libtool)
_gitroot='git://git.gnome.org/gegl'
_gitname='gegl'
pkgver() {
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}

build() {
	cd $srcdir
	msg "Connecting to gnome.org git server...."

	if [[ -d $_gitname ]]; then
		cd $_gitname
		git pull origin
	else
		git clone $_gitroot $_gitname
	fi
	msg " checkout done."

	msg "Starting make..."
	cd "$srcdir"
	[ -d "$srcdir/${_gitname}-build" ] && rm -rf "$srcdir/${_gitname}-build"
	cp -r "$srcdir"/$_gitname $_gitname-build
	cd $_gitname-build

  git checkout -b $_branch origin/$_branch	
  msg2 "Starting configure..."
	./autogen.sh --prefix=/usr --disable-docs
  msg2 "Starting make..."
  make
}
package() {
	cd "$srcdir"/$_gitname-build
	make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir"/{p2t,refine,render}
}
