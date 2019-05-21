# Maintainer: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=polished-map-git
pkgdesc="A map and tileset editor for pokecrystal, pokered, and hacks based on them like Polished Crystal."
pkgver=299.3069954
pkgrel=1
arch=(x86_64)
url="https://github.com/Rangi42/polished-map"
license=(LGPL3)
depends=(libxft libxpm)
makedepends=(git unzip)
source=(git+ssh://git@github.com/Rangi42/polished-map.git)
sha1sums=(SKIP)

pkgver(){
	cd polished-map
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare(){
	cd polished-map/lib
	unzip fltk-1.3.5.zip
	chmod +x fltk-1.3.5/configure
}

build(){
	# Build FLTK with the latest ABI enabled
	cd polished-map/lib/fltk-1.3.5
	./configure --prefix="$PWD/.." --with-abiversion=10305
	make
	make install
	cd ../..
	PATH="$PWD/lib/bin:$PATH" make
}

package(){
	cd polished-map
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
