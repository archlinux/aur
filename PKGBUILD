# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='BASIC language cross-compiler for ColecoVision/SG1000/MSX'
pkgname=cvbasic
pkgver=0.6.0
_commit=61ad63583eb3d3ad39f9a7b040ed9639d6dbb0cc
pkgrel=1
url=https://nanochess.org/cvbasic.html
arch=(x86_64)
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(git)
source=("$pkgname-$pkgver::git+https://github.com/nanochess/CVBasic.git#commit=$_commit"
	    cvbasic-asm-file-paths.patch)
b2sums=('d90deed16316e79d4eb1052e8f558d3ded1506d6c1fab2c6932f52f61ee235210adbc4be7cdf7b161cc3582effc9e790a988d7db5efc09433f9c8aa9df5d34ae'
        'c89c2c40a45ea1ab40ce850deb689cfe46d346c4659db32b80b28f306a0de063c7eaaa1c883acf79b92a4e6c9b7b9ba571f11d2982a6511d1270777fc9c17e20')

prepare () {
	cd "$pkgname-$pkgver"
	git apply "$srcdir/cvbasic-asm-file-paths.patch"
}

build () {
	cd "$pkgname-$pkgver"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o cvbasic cvbasic.c node.c driver.c cpuz80.c cpu6502.c
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/cvbasic" cvbasic_{,6502_}{pro,epi}logue.asm
	install -Dm755 -t "$pkgdir/usr/bin" cvbasic

	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic" README.md manual.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic/examples" examples/*
}
