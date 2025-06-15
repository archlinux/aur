# Contributor: Christian Hesse <mail@eworm.de>

pkgname=libetpan-git
pkgver=1.9.4.r86.g5c9eb6b
pkgrel=1
pkgdesc='A portable middleware for email access - git checkout'
arch=('x86_64')
url='https://www.etpan.org/libetpan.html'
license=('BSD-3-Clause AND BSD-3-Clause-Attribution AND BSD-4-Clause')
depends=('gnutls' 'libsasl' 'zlib' 'glibc')
makedepends=('git')
provides=('libetpan')
conflicts=('libetpan')
source=('git+https://github.com/dinhviethoa/libetpan.git')
sha256sums=('SKIP')

pkgver() {
	cd libetpan/
	git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
	cd libetpan/
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libetpan/

	./configure --prefix=/usr \
		--disable-static \
		--disable-db \
		--with-openssl=no \
		--with-gnutls=yes \
		--with-poll
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

check() {
	cd libetpan/
	make check
}

package() {
	cd libetpan/
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYRIGHT "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
