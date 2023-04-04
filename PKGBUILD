# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=sourcenavigator-ng
pkgver=4.5
pkgrel=1
epoch=
pkgdesc="a source code analysis tool"
arch=(any)
url="https://sourceforge.net/projects/sourcenav/"
license=('GPL2')
groups=()
depends=(libx11 bash perl glibc)
makedepends=(make gcc)
checkdepends=()
optdepends=()
provides=(snavigator)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://jaist.dl.sourceforge.net/project/sourcenav/NG4.5/sourcenavigator-NG4.5.tar.bz2")
noextract=()
sha256sums=('d5d8f96206f429b446c490b20fda0f7da0b794cc302a567cfebf414f30073b00')
validpgpkeys=()

prepare(){
	sed -i "s/__db_errx(env, TxnAlloc);/__db_errx(env, \"%s\", TxnAlloc);/g"  sourcenavigator-NG4.5/db4/txn/txn.c
	sed -i "s/int (\*Paf_Word)/static int (\*Paf_Word)/g" sourcenavigator-NG4.5/snavigator/parsers/cpp/cpplib/macro.c 
	sed -i "s/int (\*Paf_Word)/static int (\*Paf_Word)/g" sourcenavigator-NG4.5/snavigator/parsers/cpp/cpplib/macread.c
	grep Paf_Word sourcenavigator-NG4.5/snavigator/parsers/cpp/cpplib/macro.c 
	grep Paf_Word sourcenavigator-NG4.5/snavigator/parsers/cpp/cpplib/macread.c
}

build() {
	cd sourcenavigator-NG4.5
	./configure --prefix="$pkgdir"/opt/sourcenav &> /dev/null
	make &> /dev/null
}

package() {
	cd sourcenavigator-NG4.5
	for dir in tcl tk tix libgui db4/PORT snavigator itcl;
	do
		echo "$dir: make install" ;
		pushd $dir;
			make install || true;
		popd;
	done;
	local f;
	f="$pkgdir"/opt/sourcenav/share/itk3.2
	rm "$f";
	install -d "$f"; 
	cp -av "$srcdir"/sourcenavigator-NG4.5/itcl/itk/library/* "$f"
	install -Dm755 /dev/null $pkgdir/usr/bin/snavigator;
	echo "#!/bin/sh" >> $pkgdir/usr/bin/snavigator;
	echo "/opt/sourcenav/bin/snavigator" >> $pkgdir/usr/bin/snavigator;
}
