# Maintainer: bellotto <joangarcez2100@gmail.com>

_pkgname=porth
pkgname="${_pkgname}-gitlab"
pkgver=r1189.d409555
pkgrel=1
pkgdesc="[Unstable/W.I.P] It's like Forth but in Python."
arch=('x86_64')
url="https://gitlab.com/tsoding/porth"
license=('MIT')
depends=('binutils' 'fasm')
makedepends=('git' 'fasm')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	fasm -m 524288 ./bootstrap/porth-linux-x86_64.fasm
	chmod +x ./bootstrap/porth-linux-x86_64
	./bootstrap/porth-linux-x86_64 com ./porth.porth
	./porth com ./porth.porth
}

package() {
	cd "$srcdir/${_pkgname}"
	
	mkdir -p "$pkgdir/usr/share/${_pkgname}/examples"
	cp -R "examples/" "$pkgdir/usr/share/${_pkgname}"
	
	mkdir -p "$pkgdir/usr/lib/${_pkgname}"
	cp -RT "std/" "$pkgdir/usr/lib/${_pkgname}/"
	
	mkdir -p "$pkgdir/usr/bin/"
	cp "porth" "$pkgdir/usr/bin/${_pkgname}"
	
	mkdir -p "$pkgdir/usr/share/licenses/${_pkgname}/"
	cp "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/"
}
