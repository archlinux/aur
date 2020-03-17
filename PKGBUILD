# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=ms-tpm-20-ref-git
pkgver=r167.51d7b24
pkgrel=1
pkgdesc='Reference implementation of the TCG Trusted Platform Module 2.0 specification'
arch=('x86_64')
url='https://github.com/Microsoft/ms-tpm-20-ref'
license=('BSD')
depends=('openssl')
makedepends=('git' 'autoconf-archive')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}/TPMCmd"
	./bootstrap
}

build() {
	cd "${pkgname%-git}/TPMCmd"
	./configure --prefix=/usr CPPFLAGS="$CPPFLAGS -DALG_SM3_256=ALG_NO -DALG_SM4=ALG_NO"
	make
}

package() {
	cd "${pkgname%-git}/TPMCmd"
	make DESTDIR="$pkgdir" install
	install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
