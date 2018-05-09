# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=idevicerestore-git
epoch=1
pkgver=r572.b8b3035
pkgrel=1
pkgdesc="Restore/upgrade firmware of iOS devices"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org"
license=('LGPL3')
depends=('libirecovery-git' 'libimobiledevice-git' 'libusbmuxd-git' 'libplist-git' 'libzip' 'openssl' 'curl')
makedepends=('git')
source=("git+https://git.libimobiledevice.org/idevicerestore.git"
        "0001-configure.ac-check-for-pthreads.patch"
        "0002-configure.ac-src-Makefile.am-check-for-and-link-with.patch")
sha256sums=('SKIP'
            'c259a9f977de42fbfde75ad0c9a4d813b7d39bf217ee416902409403cd6d7931'
            '2c4a09389f3e02e44971eeec06f1979188678dc82989e3fd311677172fb3401f')

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
