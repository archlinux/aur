# Maintainer: a821 at mail de
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=libetpan-git
pkgver=1.10.1.r135.gc77d041
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
	# remove broken tests (see commit message)
	sed -i 's/mailpgp-gnupg-fixture-test.sh//' tests/Makefile.am
	sed -i 's/smime-openssl-fixture-test.sh//' tests/Makefile.am
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
	make -C libetpan/tests check
}

package() {
	cd libetpan/
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYRIGHT "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
