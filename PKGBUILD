# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tss-git
pkgver=2.4.0.r16.047217eb
pkgrel=1
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 Software Stack (TSS2)'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=('curl' 'openssl')
makedepends=('git' 'autoconf-archive' 'doxygen')
checkdepends=('cmocka' 'ibm-sw-tpm2' 'iproute2' 'uthash')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/tpm2-tss/fapi-config.json'
        'etc/tpm2-tss/fapi-profiles/P_ECCP256SHA256.json'
        'etc/tpm2-tss/fapi-profiles/P_RSA2048SHA256.json')
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
	            $( ((CHECKFUNC)) && echo --enable-unit --enable-integration)
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
