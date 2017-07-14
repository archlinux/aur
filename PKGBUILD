# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=eolie
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple web browser for GNOME"
arch=('x86_64' 'i686')
url="https://gnumdk.github.io/eolie-web/"
license=('GPL3')
depends=('gtkspell3' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'webkit2gtk')
makedepends=('gobject-introspection' 'intltool' 'itstool')
source=("https://github.com/gnumdk/$pkgname/releases/download/${pkgver%.*}/$pkgname-$pkgver.tar.xz"
        "0001-Install-webextension-into-libdir.patch")
sha256sums=('4ad882ed899cfa88a24851443a879a1bb9f720ad3639e688c05b04ad44cb63d1'
            '3d93e35a917b8101da541e73162dcbe51889c1aa3799e058ec207d59fa6976cc')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 -i ../0001-Install-webextension-into-libdir.patch
	autoreconf -fi
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
