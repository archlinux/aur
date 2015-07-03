# Contributor: <me@beroal.in.ua>
# This library is extracted from the GNU C compiler source code.
# The library file name is "gcpp" though it is named "cpp" in the source code.
# This library includes the library "iberty" ("libiberty"). The source code of "iberty" and "gcpp" are obtained from VCS so their versions match.
pkgname=libgcpp-svn
pkgver=215421
pkgrel=1
pkgdesc="The GNU C preprocessor internals. A shared object (so) library."
arch=(i686 x86_64)
url="https://gcc.gnu.org/onlinedocs/cppinternals/"
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=(glibc)
makedepends=('subversion' 'gcc')
source=(
	gcc/include::svn://gcc.gnu.org/svn/gcc/trunk/include
	gcc/libiberty::svn://gcc.gnu.org/svn/gcc/trunk/libiberty
	gcc/libcpp::svn://gcc.gnu.org/svn/gcc/trunk/libcpp
	make-so.patch
	)
sha512sums=(
	SKIP
	SKIP
	SKIP
	98a96f0138b6590d2c04ac203244b03bb55a496bacde1bac0f66e8a58f72761bb5953129e2c03d013209ab1d6867d28b75924477fe6407976f0a282d35a3f11a
	)

pkgver () {
	cd "${SRCDEST}/gcc/libcpp"
	svnversion | tr -d [A-z]
}
prepare () {
	cd "${SRCDEST}/gcc"
	svn checkout svn://gcc.gnu.org/svn/gcc/trunk . --depth files
	svn checkout svn://gcc.gnu.org/svn/gcc/trunk/gcc/config/i386 gcc/config/i386
	cp -R gcc install-sh config.sub config.guess depcomp mkinstalldirs move-if-change "$srcdir"
	cd "$srcdir/libcpp"
	patch -p1 < ../make-so.patch
}
build () {
	# "-O" because "_FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]"
	CONFIGURE_OPTION="--prefix=/usr --libdir=/usr/lib --libexecdir=/usr/lib --mandir=/usr/share/man --infodir=/usr/share/info"
	
	cd "$srcdir/libiberty"
	./configure $CONFIGURE_OPTION CFLAGS="$CFLAGS -O -fPIC" CPPFLAGS="$CPPFLAGS -O"
	make
	
	cd "$srcdir/libcpp"
	./configure $CONFIGURE_OPTION CFLAGS="$CFLAGS -O" CPPFLAGS="$CPPFLAGS -O" --enable-host-shared
	make
}
package () {
	cd "$srcdir"
	install -D libcpp/libcpp.so "$pkgdir/usr/lib/libgcpp.so"
}
