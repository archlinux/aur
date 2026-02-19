# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='BASIC language cross-compiler for ColecoVision/SG1000/MSX and other 8 bit computers'
pkgname=cvbasic
pkgver=0.9.1
_commit=abc5a7fdece3387fa5ef586e3de4dbf286b3e477
pkgrel=1
url=https://nanochess.org/cvbasic.html
arch=(x86_64)
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(git)
optdepends=('gasm80: Assembler needed to build Z80/6502 binaries')
source=("$pkgname-$pkgver::git+https://github.com/nanochess/CVBasic.git#commit=$_commit")
b2sums=('6f4d44d79ae1917f8ea5e733e6999b775a9e76475b1e4140185dcfdde8716e9de20eca1af6c6e5b66d185bd906451c8b5515374feb30af389f6457d69ab9df3a')

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
