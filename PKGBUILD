# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
pkgname=ibm-sw-tpm2
pkgver=1563
pkgrel=1
pkgdesc='An implementation of the TCG TPM 2.0 specification by IBM'
arch=('x86_64')
url='https://sourceforge.net/projects/ibmswtpm2/'
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/${pkgname//-}/ibmtpm$pkgver.tar.gz"
        'ibm-sw-tpm2-1563_gcc-10-fix.patch::https://github.com/kgoldman/ibmswtpm2/commit/9bd2926c0f359f143141c32c2b261ca100d804c8.patch')
sha512sums=('ff0b9e5f0d0070eb572b23641f7a0e70a8bc65cbf4b59dca1778be3bb014124011221a492147d4c492584e87af23e2f842ca6307641b3919f67a3f27f09312c0'
            '476cba6e66da9c88804c16ce961c4d25a64ece27242336b2fdaf3a32d4cf4d72c2cad48cbe8357607c3b6a67e507918400c0611472b23cf5d00057a392f278ef')

prepare() {
	sed -e 's|$(CCFLAGS)|& $(CFLAGS)|' \
	    -e 's|$(LNFLAGS)|& $(LDFLAGS)|' \
	    -e 's|-Werror ||' -e 's|-ggdb -O0||' \
	    -i src/makefile

	# Fix compilation with GCC 10 (https://github.com/kgoldman/ibmswtpm2/pull/3)
	patch --strip=1 --input="$srcdir/ibm-sw-tpm2-1563_gcc-10-fix.patch"
}

build() {
	cd src
	make
}

package() {
	install -Dm755 src/tpm_server -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
