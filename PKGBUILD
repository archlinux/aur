# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libowfat
pkgname=$_pkgname-cvs
pkgver=0.32+20211103
pkgrel=1
pkgdesc="Reimplementation of libdjb"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://www.fefe.de/$_pkgname/"
license=('GPL2')
depends=('glibc')
makedepends=('cvs')
provides=("$_pkgname=$pkgver" "$_pkgname.so")
conflicts=("$_pkgname")
source=("$_pkgname-fix-and-build-shared.diff")
b2sums=('e43d49cf9bcc4ae5bf94dd59c3e5e4563882955ed6e3f811e7e2596aa06ec59d22026b33533745a956cb90f8b8d4975929aa2a95266aed58f73f52f600fdeeb1')

pkgver() {
	cd $_pkgname
	printf "%s+%s" "$(sed -n '/^CURNAME=/s/.*-//p' Makefile)" "$(cvs -q log | grep ^date: | sort | awk 'END { gsub(/-/, ""); print $2 }')"
}

prepare() {
	cvs -d :pserver:cvs:@cvs.fefe.de:/cvs co $_pkgname
	patch -d $_pkgname -Np1 < $_pkgname-fix-and-build-shared.diff
}

build() {
	cd $_pkgname
	make headers
	make
}

package() {
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
