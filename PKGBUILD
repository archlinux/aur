# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libowfat
pkgname=$_pkgname-cvs
pkgver=0.34+20250122
pkgrel=1
pkgdesc="Reimplementation of libdjb"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.fefe.de/libowfat/"
license=('GPL-2.0-only')
depends=('glibc')
makedepends=('cvs')
provides=("$_pkgname=$pkgver" 'libowfat.so')
conflicts=("$_pkgname")
source=('fix-and-build-shared.diff')
b2sums=('c5ad84186d8ed5ac5f0724ad7b538513289bd14ef2c019ce193e926c10d9c93df518803bd27279aa9a14080012bcf0f248d6d1d14e9dc020813d08dc9442d21c')

pkgver() {
	cd $_pkgname
	printf "%s+%s" "$(sed -n '/^CURNAME=/s/.*-//p' Makefile)" "$(cvs -q log | grep ^date: | sort | awk 'END { gsub(/\//, ""); print $2 }')"
}

prepare() {
	cvs -d :pserver:cvs:@cvs.fefe.de:/cvs co $_pkgname
	patch -d $_pkgname -Np1 < fix-and-build-shared.diff
}

build() {
	cd $_pkgname
	make headers
	make
}

check() {
	make -C $_pkgname check
}

package() {
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
