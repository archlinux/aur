# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
pkgname=ibm-sw-tpm2
pkgver=1628
pkgrel=2
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 specification'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmswtpm2/'
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/${pkgname//-}/ibmtpm$pkgver.tar.gz"
        "ibm-sw-tpm2-1628-increase-nv-memory.patch::https://github.com/kgoldman/ibmswtpm2/commit/3e535e65e307ef9ce02d87993e98ec5dbf7e6dc2.patch")
sha512sums=('ab47caa4406ba57c0afc6fadae304fc9ef5e3e125be0f2fb1955a419cf93cd5e9176e103f0b566825abc16cca00b795f98d2b407f0a2bf7b141ef4b025d907d0'
            '6fd3319f7f3a1aa56af1964a8e4ccb211240232035910c4cdc1738b3c9787ba619dcbdffdae4a9dda1c853de734a176fb87c9b51b076b9c89e253f2ce2adf355')

prepare() {
	sed -e 's|$(CCFLAGS)|& $(CFLAGS)|' \
	    -e 's|$(LNFLAGS)|& $(LDFLAGS)|' \
	    -e 's|-Werror ||' -e 's|-ggdb -O0||' \
	    -i src/makefile

	# Increase NV memory (https://github.com/kgoldman/ibmswtpm2/pull/4)
	patch --strip=1 --input="$srcdir/ibm-sw-tpm2-1628-increase-nv-memory.patch"
}

build() {
	cd src
	make
}

package() {
	install -Dm755 src/tpm_server -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
