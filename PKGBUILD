# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tools-git
pkgver=4.2.r208.279bc782
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 tools based on tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tools'
license=('BSD')
depends=('curl' 'libutil-linux' 'openssl' 'tpm2-tss' 'libtss2-esys.so' 'libtss2-fapi.so'
         'libtss2-mu.so' 'libtss2-rc.so' 'libtss2-sys.so' 'libtss2-tctildr.so')
makedepends=('git' 'autoconf-archive' 'pandoc')
checkdepends=('cmocka' 'expect' 'ibm-sw-tpm2' 'iproute2' 'python-yaml' 'tpm2-abrmd' 'xxd')
optdepends=('tpm2-abrmd: user space resource manager')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/[-_]rc/rc/I;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	./bootstrap
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr $( ((CHECKFUNC)) && echo --enable-unit)
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 doc/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
