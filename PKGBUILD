# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
pkgname=ibm-sw-tpm2
pkgver=1682
pkgrel=2
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 specification'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmswtpm2/'
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/${pkgname//-}/ibmtpm$pkgver.tar.gz")
sha512sums=('564c2154e5459cbbf4ec052bea7909d1eaff0aa07b291c7de44b1204ecfda3c4156fa18da4499e4202b8772b54ae30d0c7c89bd12cd415f3882d17c8d340686d')

prepare() {
	cd src
	sed -e 's/$(CCFLAGS)/$(CPPFLAGS) & $(CFLAGS)/' \
	    -e 's/$(LNFLAGS)/& $(LDFLAGS)/' \
	    -e 's/-ggdb//' -e 's/-O0//' -e 's/-Werror//' \
	    -i makefile
}

build() {
	cd src
	make
}

package() {
	cd src
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
