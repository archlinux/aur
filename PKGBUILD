# Maintainer: Lobo Torres <lobo@quiltro.org>

pkgname=retroforth-fossil
pkgver=r1939.56a264e
pkgrel=1
pkgdesc="A modern, pragmatic Forth"
arch=('x86_64')
url="https://retroforth.org/"
license=('ISC')
depends=()
makedepends=('fossil')
provides=("${pkgname%-fossil}")
conflicts=("${pkgname%-fossil}")
source=('retroforth.fossil::fossil+http://fossils.retroforth.org:8000/nga')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-fossil}"
	_info=$(fossil info)
	_hash=$(echo "$_info" | sed -n 's|checkout: *\([0-9a-z]*\).*|\1|p' | cut -c 1-7)
	_revision=$(echo "$_info" | sed -n 's|check-ins: *\(.*\)|\1|p')
	printf "r%s.%s" "$_revision" "$_hash"
}

build() {
	cd "$srcdir/${pkgname%-fossil}"
	make
}

package() {
	cd "$srcdir/${pkgname%-fossil}"
	install -m 755 -d "${pkgdir}/usr/bin"
	install -cm 755 tools/retro-document.sh "${pkgdir}/usr/bin/retro-document"
	for exe in retro{,-{embedimage,extend,muri,unu,describe}}; do
		install -cm 755 "bin/$exe" "${pkgdir}/usr/bin/$exe"
	done
	make DESTDIR="${pkgdir}/" PREFIX="/usr" MANDIR="/usr/share/man/man1" install-data install-examples install-docs install-manpages
}
