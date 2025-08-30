# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='BASIC language cross-compiler for ColecoVision/SG1000/MSX and other 8 bit computers'
pkgname=cvbasic
pkgver=0.9.0
_commit=6f05ca6bcc944dbb391af47f6c4ce080a6c7aa9c
pkgrel=1
url=https://nanochess.org/cvbasic.html
arch=(x86_64)
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(git)
optdepends=('gasm80: Assembler needed to build Z80/6502 binaries')
source=("$pkgname-$pkgver::git+https://github.com/nanochess/CVBasic.git#commit=$_commit")
b2sums=('d2a67805bb447b1a4d50fd0019effdd32607c9203f9c84f9309d4ee6ad1bd47d3b7ba1bb3fabdc1ba9762e004218814f722b4ea1e3000226f05517054332587d')

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
