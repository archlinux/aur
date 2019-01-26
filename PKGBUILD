# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tss-git
pkgver=2.0.0.r165.0d26c99e
pkgrel=1
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 Software Stack (TSS2)'
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
	ACLOCAL_PATH=/usr/share/gnulib-git/m4 ./bootstrap
}

build() {
	cd "${pkgname%-git}"
	(( CHECKFUNC )) && opts=('--enable-unit' '--enable-integration')
	./configure --prefix=/usr --with-udevrulesprefix=60- "${opts[@]}"
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	echo 'u tss - "tss user for tpm2"' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
