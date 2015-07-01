# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

_archivename=gcc
_target=mipsel-linux
pkgname=$_target-${_archivename}3-initial
pkgver=3.3.4
pkgrel=1
pkgdesc="mipsel-linux GNU (cross) C compiler to be used as a bootstrap when building a cross-compilation toolchain"
url="http://www.gnu.org/software/$_archivename/"
provides=($_target-gcc3)
depends=(glibc $_target-binutils)
source=(ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-$pkgver/$_archivename-core-$pkgver.tar.bz2)
md5sums=('102b390dbc919593f9b70d09b7d67469')
options=(NOSTRIP)

build() {
	cd $startdir/src/$_archivename-$pkgver
	# Don't install libiberty
	sed -i '/install_to_$(INSTALL_DEST)/d' libiberty/Makefile.in

	mkdir -p $startdir/src/$_archivename-build
	cd $startdir/src/$_archivename-build
 	$startdir/src/$_archivename-$pkgver/configure --target=$_target \
 		--prefix=/usr --with-gnu-as --with-gnu-ld \
 		--disable-shared --disable-nls --disable-threads || return 1 
	make || return 2
	make DESTDIR=$startdir/pkg install || return 3

	# Simulate libgcc_eh (built when --enable-shared is passed) to allow for
	# shared glibc to be built
	ln -s libgcc.a $startdir/pkg/usr/lib/gcc-lib/$_target/$pkgver/libgcc_eh.a

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
}
