# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=idevicerestore-git
epoch=1
pkgver=1.0.0.r186.g653349a
pkgrel=1
pkgdesc="Restore/upgrade firmware of iOS devices"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org"
license=('LGPL3')
depends=('libzip' 'openssl' 'curl' 'libimobiledevice-glue-git' 'libplist-git' 'libimobiledevice-git' 'libirecovery-git')
makedepends=('git')
source=("git+https://github.com/libimobiledevice/idevicerestore"
        '0001-configure.ac-check-for-pthreads.patch'
        '0002-Fix-type-mismatch-calling-libplist.patch')
sha256sums=('SKIP'
            'd7fcc4e46a175d309298bd95d330c027fcca7dba3226f3e1b802c8ebe8d8ed15'
            '768f42e4d1e26230daa21bbe0a87b0d16d41f39f2ecba4f195d5af3f77d66648')

pkgver() {
	cd idevicerestore
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd idevicerestore

	for p in "${source[@]}"; do
		if [[ ${p} == *.patch ]]; then
			git apply -3 "${srcdir}/${p}"
		fi
	done
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd idevicerestore
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	#sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # not needed anymore (libtool honors $LDFLAGS now)
	make
}

check() {
	cd idevicerestore
	make check
}

package() {
	cd idevicerestore
	make DESTDIR="$pkgdir" install
}
