# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=eolie-git
_gitname=eolie
pkgver=0.9.r1.ge5a7d6f
pkgrel=1
pkgdesc="Simple web browser for GNOME"
arch=('x86_64' 'i686')
url="https://gnumdk.github.io/eolie-web/"
license=('GPL3')
depends=('gtkspell3' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'webkit2gtk')
makedepends=('gobject-introspection' 'intltool' 'itstool')
source=("git+https://github.com/gnumdk/${_gitname}.git")
sha256sums=('SKIP')
conflicts=('eolie')
provides=("eolie=$pkgver")

prepare() {
	cd "${_gitname}"
 	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_gitname}"
	./autogen.sh --prefix=/usr --disable-schemas-compile
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
	cd "$srcdir/${_gitname}"
	make DESTDIR="$pkgdir" install
}
