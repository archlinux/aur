# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=idevicerestore-git
pkgver=481.704afa3
pkgrel=1
pkgdesc="Restore/upgrade firmware of iOS devices"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org"
license=('LGPL3')
depends=('usbmuxd-git' 'libirecovery-git' 'libimobiledevice-git' 'libzip' 'openssl' 'curl')
makedepends=('git')
source=("git://git.sukimashita.com/idevicerestore.git")
md5sums=('SKIP')

pkgver() {
	cd idevicerestore

	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd idevicerestore

	sed -re 's|automake|& --add-missing|' -i autogen.sh
}

build() {
	cd idevicerestore

	./autogen.sh --prefix=/usr
	make libirecovery_CFLAGS="-I/usr/include" libirecovery_LIBS="-L/usr/lib -lirecovery -lusb-1.0"
}

package() {
	cd idevicerestore

	make DESTDIR="$pkgdir" install
}
