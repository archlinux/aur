# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=idevicerestore-git
epoch=1
pkgver=r663.0b4810f
pkgrel=1
pkgdesc="Restore/upgrade firmware of iOS devices"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org"
license=('LGPL3')
depends=('libirecovery-git' 'libimobiledevice-git' 'libzip' 'openssl' 'curl')
makedepends=('git')
source=("git+https://github.com/libimobiledevice/idevicerestore"
        "0001-configure.ac-check-for-pthreads.patch")
sha256sums=('SKIP'
            'c259a9f977de42fbfde75ad0c9a4d813b7d39bf217ee416902409403cd6d7931')

pkgver() {
	cd idevicerestore

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd idevicerestore

	for p in "${srcdir}"/*.patch; do
		patch -Np1 -i "${p}"
	done
#	sed -re 's|automake|& --add-missing|' -i autogen.sh
}

build() {
	cd idevicerestore

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd idevicerestore

	make DESTDIR="$pkgdir" install
}
