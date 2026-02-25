# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='BASIC language cross-compiler for ColecoVision/SG1000/MSX and other 8 bit computers'
pkgname=cvbasic
pkgver=0.9.1
_commit=20b0e4b7a31bea9755a8c7a32a26e29d9265259e
pkgrel=2
url=https://nanochess.org/cvbasic.html
arch=(x86_64)
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(git)
optdepends=('gasm80: Assembler needed to build Z80/6502 binaries')
source=("$pkgname-$pkgver::git+https://github.com/nanochess/CVBasic.git#commit=$_commit")
b2sums=('a2b90c24e0c2de81ddbea0c9d8964133810fee5a457b4ee170574011ab65aec63ed3257129446af5d0351cacdeca531c30aeae1659136e93ad75762fc854d3ed')

build () {
	cd "$pkgname-$pkgver"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} \
		-DASM_LIBRARY_PATH=\"/usr/share/cvbasic\" \
		-o cvbasic cvbasic.c node.c driver.c cpuz80.c cpu6502.c cpu9900.c
}

check () {
	cd "$pkgname-$pkgver"
	./cvbasic examples/viboritas.bas examples/viboritas.asm .
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/cvbasic" cvbasic_{,6502_,9900_}{pro,epi}logue.asm
	install -Dm755 -t "$pkgdir/usr/bin" cvbasic

	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic" README.md manual.txt 'README - TI99.md' linkticart.py
	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic/examples" examples/*
}
