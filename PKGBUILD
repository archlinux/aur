# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
pkgname=ibm-sw-tpm2
pkgver=1636
pkgrel=1
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 specification'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmswtpm2/'
license=('BSD')
depends=('openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kgoldman/ibmswtpm2/archive/rev$pkgver.tar.gz")
sha512sums=('3540486b21ade92a50fc1e2b41b23f6afefe23e1de05dd009e0ade021bac2f6ca0d61d4b61af9466f3c70327047ebf9b8d6891c100b1949a0d9c0c81335cbb10')

prepare() {
	cd "${pkgname//-}-rev$pkgver/src"
	sed -e 's/$(CCFLAGS)/$(CPPFLAGS) & $(CFLAGS)/' \
	    -e 's/$(LNFLAGS)/& $(LDFLAGS)/' \
	    -e 's/-ggdb//' -e 's/-O0//' -e 's/-Werror//' \
	    -i makefile
}

build() {
	cd "${pkgname//-}-rev$pkgver/src"
	make
}

package() {
	cd "${pkgname//-}-rev$pkgver/src"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
