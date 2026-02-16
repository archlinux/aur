# Maintainer: aksr <aksr at t-com dot me>
pkgname=grap-git
pkgver=r366.bb899c8
pkgrel=1
pkgdesc='A language for typesetting graphs specified and first implemented by Brian Kernighan and Jon Bentley at Bell Labs.'
arch=('i686' 'x86_64')
url='https://www.lunabase.org/~faber/Vault/software/grap/'
license=('custom:BSD-3-Clause')
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/snorerot13/grap")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	autoreconf -vi
	./configure --prefix=/usr --with-example-dir=/usr/share/doc/grap/examples
	make
}

check() {
	cd "$srcdir/$pkgname"
	make -k check
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	rm $pkgdir/usr/share/doc/${pkgname%-*}/{README,CHANGES,COPYRIGHT,grap.man}
	install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/${pkgname%-*}/COPYRIGHT
}
