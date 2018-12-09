# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=luksmeta-git
pkgver=9.r0.3e3cba3
pkgrel=2
pkgdesc='Library for storing metadata in the LUKSv1 header'
arch=('x86_64')
url='https://github.com/latchset/luksmeta'
license=('LGPL')
depends=('cryptsetup')
makedepends=('git' 'asciidoc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        'Relax-content-tests-in-test-suite.patch')
sha512sums=('SKIP'
            '145f6ceb7bad2090067c5e994bb0f89ce6388cc3c5b3e27a48704c3ae33615a81dcf309b54aa0d0004782890f9260560a24f274d442b3a397a352f5bac5b638e')

pkgver() {
	cd "${pkgname%-git}"
	printf '%s' "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname%-git}"
	# https://github.com/latchset/luksmeta/issues/6
	patch --strip=1 --input="$srcdir/Relax-content-tests-in-test-suite.patch"
	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}
