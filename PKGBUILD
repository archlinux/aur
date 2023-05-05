# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libirecovery-git
epoch=2
pkgver=1.0.0.r59.g28be953
pkgrel=1
pkgdesc="Library and utility to talk to iBoot/iBSS via USB"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org/"
license=('LGPL2.1')
depends=('libusb' 'readline' 'libplist-git' 'libimobiledevice-glue-git')
makedepends=('git')
provides=(libirecovery-1.0.so "libirecovery=$pkgver")
conflicts=("libirecovery")
source=("git+https://github.com/libimobiledevice/libirecovery")
md5sums=('SKIP')

pkgver() {
	cd libirecovery
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd libirecovery
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libirecovery
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	#sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # not needed anymore (libtool honors $LDFLAGS now)
	make
}

package() {
	cd libirecovery
	make DESTDIR="$pkgdir" install
}
