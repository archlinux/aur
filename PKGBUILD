# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tools-git
pkgver=5.2.r64.7fc5a005
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 tools based on tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tools'
license=('BSD')
depends=('curl' 'openssl' 'tpm2-tss' 'util-linux-libs' 'libtss2-esys.so' 'libtss2-fapi.so'
         'libtss2-mu.so' 'libtss2-rc.so' 'libtss2-sys.so' 'libtss2-tctildr.so')
makedepends=('git' 'autoconf-archive' 'pandoc')
checkdepends=('cmocka' 'expect' 'iproute2' 'python-yaml' 'swtpm' 'tpm2-abrmd' 'xxd')
optdepends=('tpm2-abrmd: user space resource manager')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
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
	install -Dm644 docs/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
