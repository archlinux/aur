# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
pkgname=ibm-sw-tpm2
pkgver=1661
pkgrel=1
pkgdesc='Implementation of the TCG Trusted Platform Module 2.0 specification'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmswtpm2/'
license=('BSD')
depends=('openssl')
options=('debug')
source=("https://downloads.sourceforge.net/${pkgname//-}/ibmtpm$pkgver.tar.gz"
        'ibm-sw-tpm2-1661_openssl-3.patch::https://github.com/kgoldman/ibmswtpm2/commit/920ce656af833ce6fb2b76c34cf8f58a4b6a4175.patch')
sha512sums=('942baa26311472d6af6b2c3b3b4132718e5e2b1eaa7decb0f64d910cbb7acaa4814ac95b18b5f2a4ea43990978cd5577b8fd50b158a055ff475710ad2426f6cb'
            '1bc30948199ff419a3421e51a3dc0552e69ae4d7d9ce69daa3369a9fac4d539cc1942090d18246142a4c77fcd4672551ef0a1ce96c240cb3a17fbc1de7c16083')

prepare() {
	patch --forward --strip=1 --input="$srcdir/ibm-sw-tpm2-1661_openssl-3.patch"
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
