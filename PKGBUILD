# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=luksmeta-git
pkgver=9.r2.fe3e941
pkgrel=1
pkgdesc='Library for storing metadata in the LUKSv1 header'
arch=('x86_64')
url='https://github.com/latchset/luksmeta'
license=('LGPL')
depends=('cryptsetup')
makedepends=('git' 'asciidoc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        'fix.test-luksmeta.patch')
sha512sums=('SKIP'
            '674574292ecc9912d63b90db9ffa7c3f862226424d308a6612d769943edde44086268bdcb7a8f8d26b954b881189090520400d49cb14b454537e9f9ea8c3f560')

pkgver() {
	cd "${pkgname%-git}"
	printf '%s' "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname%-git}"

	# https://github.com/latchset/luksmeta/issues/9
	patch --strip=1 --input="$srcdir/fix.test-luksmeta.patch"

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
