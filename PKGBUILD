# Maintainer: Peter Tirsek <peter@tirsek.com>
# Contributor: Sijmen J. Mulder <ik@sjmulder.nl>

# Note: To avoid conflicts with the "trickle" package, the binaries and man
# pages in this package are renamed as follows:
#
#     trickle -> trickle-pipe
#     tritty  -> trickle-tty

pkgname=trickle-pipe
_pkgname=trickle
pkgver=1.0.1
pkgrel=1
pkgdesc='Rate limit pipes and ttys to 1990s era serial port speeds'
arch=(x86_64)
url="https://codeberg.org/sjmulder/trickle"
license=(BSD-2-Clause)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("dd096c3f87868fb0a7d006b035881fff2c2ebee7468b7b609d435befc64079ae")

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

check() {
	cd "${srcdir}/${_pkgname}"
	echo a | ./trickle >/dev/null
	./tritty -- echo -n
}

package() {
	cd "${srcdir}/${_pkgname}"
	make install DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man"
	mv "${pkgdir}/usr/bin/trickle" "${pkgdir}/usr/bin/trickle-pipe"
	mv "${pkgdir}/usr/bin/tritty" "${pkgdir}/usr/bin/trickle-tty"
	mv "${pkgdir}/usr/share/man/man1/trickle.1" "${pkgdir}/usr/share/man/man1/trickle-pipe.1"
	mv "${pkgdir}/usr/share/man/man1/tritty.1" "${pkgdir}/usr/share/man/man1/trickle-tty.1"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
