# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tss-git
pkgver=3.1.0.r89.e900ef04
pkgrel=1
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 Software Stack (TSS2)'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=('curl' 'json-c' 'openssl' 'libjson-c.so')
makedepends=('git' 'autoconf-archive' 'cmocka' 'doxygen' 'libtpms')
checkdepends=('iproute2' 'swtpm' 'uthash')
provides=("${pkgname%-git}" 'libtss2-esys.so' 'libtss2-fapi.so' 'libtss2-mu.so' 'libtss2-rc.so'
          'libtss2-sys.so' 'libtss2-tctildr.so')
conflicts=("${pkgname%-git}")
backup=('etc/tpm2-tss/fapi-config.json'
        'etc/tpm2-tss/fapi-profiles/P_ECCP256SHA256.json'
        'etc/tpm2-tss/fapi-profiles/P_RSA2048SHA256.json')
options=('!emptydirs' '!lto')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/[-_]rc/rc/;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	./bootstrap
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	            --with-runstatedir=/run --with-sysusersdir=/usr/lib/sysusers.d \
	            --with-tmpfilesdir=/usr/lib/tmpfiles.d --with-udevrulesprefix=60- \
	            --enable-unit $( ((CHECKFUNC)) && echo --enable-integration)
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
