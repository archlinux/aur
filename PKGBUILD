# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=tpm2-tss-engine-git
pkgver=1.0.0.r69.22a6ae8
pkgrel=1
pkgdesc='OpenSSL engine for Trusted Platform Module 2.0 devices'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss-engine'
license=('BSD')
depends=('openssl' 'tpm2-tss' 'libtss2-esys.so' 'libtss2-mu.so' 'libtss2-tctildr.so')
makedepends=('git' 'autoconf-archive' 'pandoc')
checkdepends=('cmocka' 'expect' 'iproute2' 'swtpm' 'tpm2-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/[-_]rc/rc/;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr $( ((CHECKFUNC)) && echo --enable-unit --enable-integration)
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
