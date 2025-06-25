# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=idevicerestore-git
epoch=1
pkgver=1.0.0.r232.g8061f08
pkgrel=1
pkgdesc="Restore/upgrade firmware of iOS devices"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org"
license=('LGPL3')
depends=('libzip' 'openssl' 'curl' 'libimobiledevice-glue-git' 'libplist-git' 'libimobiledevice-git' 'libirecovery-git' 'libtatsu-git')
makedepends=('git')
source=("git+https://github.com/libimobiledevice/idevicerestore"
        '0001-configure.ac-check-for-pthreads.patch'
	'fix-print-func-usage.patch')
sha256sums=('SKIP'
            '1eef0bb3be0e88658c0b32a3e707fac9467f8d03dffd508484db410156c16003'
            '10e27d2332b0a6ec87d5ea21d26f9509b48a8ae6ee0cf6b8ce6a81e65c93bbe7')

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
	export LIBS="-lm"
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
