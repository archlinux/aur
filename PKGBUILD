# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libowfat
pkgname=$_pkgname-cvs
pkgver=0.32+20221213
pkgrel=1
pkgdesc="Reimplementation of libdjb"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://www.fefe.de/libowfat/"
license=('GPL2')
depends=('glibc')
makedepends=('cvs')
provides=("$_pkgname=$pkgver" 'libowfat.so')
conflicts=("$_pkgname")
source=('fix-and-build-shared.diff')
b2sums=('594c3d79d21016432055cba52a7f8a5252be898f2344d15ed3b46793b46dff883698501cab0800f9b09cd15bc371992858e42649148e529d50e8cfd771708698')

pkgver() {
	cd $_pkgname
	printf "%s+%s" "$(sed -n '/^CURNAME=/s/.*-//p' Makefile)" "$(cvs -q log | grep ^date: | sort | awk 'END { gsub(/-/, ""); print $2 }')"
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
