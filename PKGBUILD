# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ntvcm
pkgver=0.0.20240727
pkgrel=1
pkgdesc='NT Virtual CP/M Machine, emulates CP/M running on an 8080/Z80 processor'
_commit=3fdf01e9efe2f52c3f2ac4e36e3c6c481659b2cb
url=https://github.com/davidly/ntvcm
arch=(x86_64)
license=(CC0-1.0)
depends=(glibc)
makedepends=(git)
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
b2sums=('77c483c221ae60e3f51618ac7ea8fe13b74349d6ffee48a5ab279b748c2f1c69f27def51c90d7a117250a9aaa077d787688bf33bcddc07d708678966f260e5d4')

build() {
	cd "$pkgname-$pkgver"
	"${CXX:-c++}" $CXXFLAGS $LDFLAGS -I. -o ntvcm ntvcm.cxx x80.cxx
}

check() {
	cd "$pkgname-$pkgver"

	./ntvcm -8 tests/8080EX1.COM
	./ntvcm -8 tests/8080PRE.COM
	./ntvcm -8 tests/TST8080.COM
	./ntvcm -8 tests/TEST.COM
	./ntvcm -8 tests/CPUTEST.COM
	./ntvcm tests/CPUTEST.COM

	./ntvcm z80test/zexall.com
	./ntvcm z80test/zexdoc.com
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin" ntvcm
}
