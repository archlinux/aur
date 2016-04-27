# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Originally adapted from the djgpp-crx package in AUR3; the submitter was "Schala".

pkgname=djgpp-djcrx
pkgver=2.05
pkgrel=4
pkgdesc="Headers and utilities for the djgpp cross-compiler"
arch=(i686 x86_64)
url="http://www.delorie.com/djgpp/"
depends=('glibc')
license=(GPL LGPL custom:djgpp)
provides=('djgpp-djcrx-bootstrap')
conflicts=('djgpp-djcrx-bootstrap')
source=(
	"http://www.delorie.com/pub/djgpp/current/v2/djcrx${pkgver//./}.zip"
	"http://www.delorie.com/pub/djgpp/current/v2/djlsr${pkgver//./}.zip"
	info.install
	ttyscrn.patch
	nmemalign.patch
	fseeko64.patch
	asm.patch
)
makedepends=(djgpp-gcc)
sha512sums=(
	'248034a3c026971eeaa6421ef40f44d03873c62d4edf97490e98c71ac76662eaed531eb734e137a38a644483a34065c3ffc70d3d739682d53c8863bf7b521b90'
	'5d2b9c155b926284138c01221c783c4808020865fa91600749d63a2039f5acd076eec5b25c38cb38b4aa73ae6b998f1614baa7e98818bc3816bc2a5f67f8229c'
	'65f18cce2297531606d850e8482fc604b2ef96402215cb1c3269ca215110f5884b48558c7dfd91502104beb6cb4dc808c2224c05ffec0dd7a89d45b0b9e465e0'
	'f5d2220384795ca2ce70e8e2315afb77d84fb5600bd3d947a72110613d700d55a575f165560a820d43f7483b3709ed65152c8bbb7a77dd7a290090459cf4acb7'
	'28acca2ecc8641fb27c2211f223df13efe7e070785c554928912ca1c8425d971da22a4d7afc1dfce9250e2479d0c4da162422c6c121f6789c0c446c141dd2a11'
	'c004d2e5fd484f86986584e03003f62003ed6a3b8473c44e2f6e99562276e464b54e59cbe629e2d07e7d5d03159d2beddfeef2b96d8adb694a7c6f9072e06332'
	'2deade5e1b87c2df5cfce9fa41fb375c9f80bc2ff20db9cb19a828b2baada5effd37dc9f8abf6d98574d1e5f487c147d3fcc347a9e5c5848a851e0455111af8f'
)
options=(!buildflags !strip)
install=info.install

_target_alias='i686-pc-msdosdjgpp'

prepare() {
	cd "$srcdir"

	sed -i -e "s/i586-pc-msdosdjgpp/$_target_alias/" \
		src/makefile.def

	# enable building without an ldscript
	echo 'char **_environ;' > src/libc/crt0/environ.c
	sed -i -e '/dfinfo\.c/ a \
SRC += environ.c' \
		src/libc/crt0/makefile

	# fix gcc6 build
	echo -Wno-nonnull-compare >> src/gcc.opt
	echo -Wno-misleading-indentation >> src/gcc.opt
	echo -Wno-unused-const-variable >> src/gcc.opt

	# gcc provides its own float.h which masks this one
	ln -fs float.h include/djfloat.h
	sed -i -e 's/<float\.h>/<djfloat.h>/' \
		src/libc/emu387/npxsetup.c \
		src/libc/go32/dpmiexcp.c \
		src/utils/redir.c

	# fix libc bugs
	patch -Np0 < ../ttyscrn.patch
	patch -Np0 < ../nmemalign.patch
	patch -Np0 < ../fseeko64.patch
	patch -Np0 < ../asm.patch

	# cosmetics
	sed -i -e '/@$(MISC) echo - / d; s/^\t@/\t/' \
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
		install -Dm 0644 "$_file" "$pkgdir/usr/share/info/djgpp-$_file"
	done
}
