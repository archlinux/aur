# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tools-git
pkgver=4.1.1rc1.r0.9a79aab0
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 tools based on tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tools'
license=('BSD')
depends=('curl' 'openssl' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'pandoc')
checkdepends=('cmocka' 'ibm-sw-tpm2' 'iproute2' 'python-yaml' 'tpm2-abrmd' 'vim')
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
	(( CHECKFUNC )) && _opts=('--enable-unit')
	./configure --prefix=/usr "${_opts[@]}"
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
