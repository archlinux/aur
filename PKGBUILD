# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=libgwavi-git
_pkg="${pkgname%-git}"
pkgver=r52.c7ffd34
pkgrel=1
pkgdesc="A tiny C library for creating AVI files"
arch=('x86_64')
url="https://github.com/Rolinh/libgwavi"
license=('BSD')
depends=('glibc')
makedepends=('doxygen' 'git')
provides=("$_pkg" "$_pkg.so")
conflicts=("$_pkg")
source=("$_pkg::git+$url"
        'Makefile.patch')
sha256sums=('SKIP'
            'da52ae0f9ba8a3d751aa84226961bcc119e40de7a137cc5b0f3d1fd3cfe2606c')

pkgver() {
	cd "$_pkg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	patch -p1 -d "$_pkg" < Makefile.patch
}

build() {
	make -C "$_pkg"
	make -C "$_pkg" doc
}

package() {
	cd "$_pkg"
	install -Dvm644 inc/gwavi.h -t "$pkgdir/usr/include/"
	install -Dv lib/* -t "$pkgdir/usr/lib/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 doc/man/man3/gwavi.{c,h}.3 -t "$pkgdir/usr/share/man/man3/"
}
