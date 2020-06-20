# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=idevicerestore-git
epoch=1
pkgver=r705.21a242e
pkgrel=1
pkgdesc="Restore/upgrade firmware of iOS devices"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org"
license=('LGPL3')
depends=('libirecovery-git' 'libimobiledevice' 'libzip' 'openssl' 'curl')
makedepends=('git')
source=("git+https://github.com/libimobiledevice/idevicerestore"
        "0001-configure.ac-check-for-pthreads.patch")
sha256sums=('SKIP'
            'd7fcc4e46a175d309298bd95d330c027fcca7dba3226f3e1b802c8ebe8d8ed15')

pkgver() {
	cd idevicerestore
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd idevicerestore
	for p in "${srcdir}"/*.patch; do
		patch -Np1 -i "${p}"
	done
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd idevicerestore
	./configure --prefix=/usr
	make
}

package() {
	cd idevicerestore
	make DESTDIR="$pkgdir" install
}
