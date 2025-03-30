# Maintainer: Luiz Henrique Laurini <luizhenriquelaurini@gmail.com>
pkgname=exchange-git
_pkgname=${pkgname%-git}
pkgver=r8.6ea7b39
pkgrel=1
pkgdesc="Exchange names of two files or directories atomically"
arch=('x86_64')
url="https://github.com/AbhyudayaSharma/exchange"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/AbhyudayaSharma/exchange.git'
        'use_implicit_rule.patch')
sha256sums=('SKIP'
            '1e1a9b33273e58d5bbf6632f1d97452392fa4db67c8b2a8cf30fc15089361019')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$srcdir/$_pkgname"
	# Patch Makefile to use environment variables (CC, CFLAGS, ...)
        patch -p1 -i "$srcdir/use_implicit_rule.patch"
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
