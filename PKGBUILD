# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Adam Eberlin < ae at adameberlin dot com >

pkgname=ifuse-git
epoch=2
pkgver=1.1.4.r8.gc4ab3d6
pkgrel=1
pkgdesc='A fuse filesystem to access the contents of an iPhone or iPod Touch'
url='http://libimobiledevice.org/'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('libimobiledevice-git' 'libplist-git' 'fuse3')
makedepends=('git')
provides=("ifuse=$pkgver")
conflicts=('ifuse')
source=("git+https://github.com/libimobiledevice/ifuse")
md5sums=('SKIP')

pkgver() {
	cd ifuse
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd ifuse
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd ifuse
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	#sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # not needed anymore (libtool honors $LDFLAGS now)
	make
}

check() {
	cd ifuse
	make check
}

package() {
	cd ifuse
	make DESTDIR="${pkgdir}" install
}
