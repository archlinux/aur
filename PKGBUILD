# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Maurice Bos <m-ou.se@m-ou.se>
# Contributor: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-binutils
pkgver=2.26
pkgrel=5
_commit=71090e7a
pkgdesc="This package is now obsolete, use cloudabi-clang instead."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc>=2.23')
#source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2")
#sha256sums=('c2ace41809542f5237afc7e3b8f32bb92bc7bc53c6232a84463c423b0714ecd9')

prepare() {
	echo
	error "This package is obsolete. You should use cloudabi-clang instead which adds symlinks for lld.\n           %s" \
	"If you insist on building this package, feel free to edit the PKGBUILD to remove this warning and uncomment the sources."
	false

	# hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" "$srcdir/binutils-$pkgver/libiberty/configure"
	mkdir -p "$srcdir/build-x86_64"
	mkdir -p "$srcdir/build-aarch64"

	cd "$srcdir/build-x86_64"
	"$srcdir/binutils-$pkgver/configure" --prefix=/usr --disable-gdb --disable-nls --target=x86_64-unknown-cloudabi

	cd "$srcdir/build-aarch64"
	"$srcdir/binutils-$pkgver/configure" --prefix=/usr --disable-gdb --disable-nls --target=aarch64-unknown-cloudabi
}

build() {
	cd "$srcdir/build-x86_64"
	make
	cd "$srcdir/build-aarch64"
	make
}

package() {
	cd "$srcdir/build-x86_64"
	make install DESTDIR="$pkgdir"
	cd "$srcdir/build-aarch64"
	make install DESTDIR="$pkgdir"
	rm -r "$pkgdir"/usr/{x86_64,aarch64}-unknown-cloudabi/bin

	rm -r "$pkgdir/usr/share/info"
	rm "$pkgdir/usr/share/man/man1/x86_64-unknown-cloudabi-"{dlltool,nlmconv,windres,windmc}*
}
