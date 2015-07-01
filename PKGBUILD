# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

_archivename=gcc
_target=mipsel-linux
pkgname=$_target-${_archivename}3
pkgver=3.3.4
pkgrel=1
pkgdesc="mipsel-linux GNU (cross) Compiler Collection"
url="http://www.gnu.org/software/$_archivename/"
provides=($_target-gcc3)
conflicts=($_target-gcc3-initial)
depends=(glibc $_target-binutils)
source=(ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-$pkgver/$_archivename-$pkgver.tar.bz2)
md5sums=('a1c267b34f05c8660b24251865614d8b')
options=(NOSTRIP)

build() {
	cd $startdir/src/$_archivename-$pkgver
	# Don't install libiberty
	#sed -i '/install_to_$(INSTALL_DEST)/d' libiberty/Makefile.in

	mkdir -p $startdir/src/$_archivename-build
	cd $startdir/src/$_archivename-build

	export CFLAGS="-O2"
	export CXXFLAGS="-O2"

 	$startdir/src/$_archivename-$pkgver/configure --target=$_target \
 		--prefix=/usr --with-gnu-as --with-gnu-ld \
		--enable-languages=c,c++ \
		--disable-nls --enable-threads || return 1
	make || return 2
	make DESTDIR=$startdir/pkg install || return 3

	mkdir -p $startdir/pkg/usr/$_target/bin/
	for FILE in $startdir/pkg/usr/bin/$_target-*; do
		ln -s ${FILE/*\//\/usr\/bin\/} \
			$startdir/pkg/usr/$_target/bin/${FILE/*$_target-/}
	done
	for MANPAGE in cpp gcov; do
		mv $startdir/pkg/usr/man/man1/${MANPAGE}.1 \
			$startdir/pkg/usr/man/man1/$_target-${MANPAGE}.1
	done
	# already present in the system
	rm -rf $startdir/pkg/usr/man/man7/
	rm -rf $startdir/pkg/usr/lib/libiberty.a
}
