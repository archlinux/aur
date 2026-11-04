# Maintainer: Timothy Redaelli <timothy@fsfe.org>

# Based on exfat-utils PKGBUILD
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Alex <mail.avatar@gmail.com>

pkgname=fuse-exfat-mister-git
_pkgname=exfat-MiSTer
pkgver=r568.43f4773
pkgrel=1
pkgdesc='FUSE-based exFAT file system driver (fork with MiSTer symlinks)'
url="https://github.com/drizzt/$_pkgname"
arch=(x86_64)
license=(GPL2)
depends=(glibc
         fuse3)
conflicts=(fuse-exfat)
provides=(fuse-exfat)
replaces=(fuse-exfat)
source=('git+https://github.com/drizzt/exfat-MiSTer.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${_pkgname}"
	autoreconf -fiv
}

build() {
	cd "${_pkgname}"
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin
	make -C libexfat CCFLAGS="$CFLAGS $CPPFLAGS -std=c99" LINKFLAGS="$LDFLAGS"
	make -C fuse CCFLAGS="$CFLAGS $CPPFLAGS -std=c99" LINKFLAGS="$LDFLAGS"
}

package() {
	cd "${_pkgname}"
	make -C fuse DESTDIR="$pkgdir" install
}
