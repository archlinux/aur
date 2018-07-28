# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Hexchain Tong <i at hexchain dot org>

pkgname=tpm2-tss-git
pkgver=2.0.0.r38.91e7bd65
pkgrel=1
pkgdesc='TPM (Trusted Platform Module) 2.0 Software Stack (TSS)'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=('libgcrypt')
makedepends=('git' 'autoconf-archive' 'cmocka>=1.0.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./bootstrap
	./configure --prefix=/usr --enable-unit --disable-static --with-pic
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
