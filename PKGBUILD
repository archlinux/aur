# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tss-git
pkgver=2.0.0.r150.303412cb
pkgrel=1
pkgdesc='Implementation of the Trusted Platform Module 2.0 Software Stack (TSS2)'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=('openssl')
makedepends=('git' 'autoconf-archive' 'doxygen' 'gnulib-git')
checkdepends=('cmocka' # for unit test suite
              'ibm-sw-tpm2' 'iproute2' 'procps-ng' 'uthash') # for integration test suite
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf '%s' "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname%-git}"
	./bootstrap --include=/usr/share/gnulib-git/m4
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --enable-unit --enable-integration
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
