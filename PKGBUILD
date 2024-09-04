# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='BASIC language cross-compiler for ColecoVision/SG1000/MSX and other 8 bit computers'
pkgname=cvbasic
pkgver=0.7.0
_commit=002fa74204b5f20c43012272c970e851e00ec88b
pkgrel=1
url=https://nanochess.org/cvbasic.html
arch=(x86_64)
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(git)
optdepends=('gasm80: Assembler needed to build Z80/6502 binaries')
source=("$pkgname-$pkgver::git+https://github.com/nanochess/CVBasic.git#commit=$_commit"
        0001-Allow-setting-a-default-library_path-at-build-time.patch)
b2sums=('7dff015f9ff15fce9234c2c55a27b903e30a89257eb8bbe7a912bcae5a7907aca329b91777c8c3cc3995f69d3e999cfa1de15b0868cdb78ea999d534700b2dfe'
        '36947d4028463875e0bd298764e902011b02f7f43630ca1ee64568487bb1e1beb88682ffca930ffaaab8e83ffda81dc69144e82f5ad7b2790de2f732b18aea40')

prepare () {
	cd "$pkgname-$pkgver"
	git apply "$srcdir/0001-Allow-setting-a-default-library_path-at-build-time.patch"
}

build () {
	cd "$pkgname-$pkgver"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} \
		-DASM_LIBRARY_PATH=\"/usr/share/cvbasic\" \
		-o cvbasic cvbasic.c node.c driver.c cpuz80.c cpu6502.c cpu9900.c
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/cvbasic" cvbasic_{,6502_,9900_}{pro,epi}logue.asm
	install -Dm755 -t "$pkgdir/usr/bin" cvbasic

	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic" README.md manual.txt 'README - TI99.md'
	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic/examples" examples/*
}
