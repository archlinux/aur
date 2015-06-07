# Contributor: SebRmv <sbriais at-symbol free dot fr>
# PKGBUILD based on cross-mipsel-linux-gnu-binutils
# (make by: Vojtech Horky <vojta . horky at-symbol seznam . cz>)
pkgname=cross-m68k-atari-mint-binutils
_pkgname=binutils
_target="m68k-atari-mint"
pkgver=2.23.2
pkgrel=4
pkgdesc="A set of programs to assemble and manipulate binary and object files for the M68K architecture"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=("ftp://ftp.gnu.org/gnu/binutils/${_pkgname}-${pkgver}.tar.bz2" "binutils-2.23.2-mint-20130327.patch.bz2" "tc-m68k.c.patch")
sha1sums=('042c51073205ebaf88c272d6168f9deb71984b56' 'd6c21353905e24e3f3f410e4251866dc3ed6af8c' 'c76e49cf19ece5bf01d9d67274950f078ce30fe2')
_sysroot="/usr/lib/cross-${_target}"

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}

        patch -Np1 < ../binutils-2.23.2-mint-20130327.patch
        patch -p0 < ../tc-m68k.c.patch
}

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

        CFLAGS=${CFLAGS//-D_FORTIFY_SOURCE=?/}
        export CFLAGS
        
        CPPFLAGS=${CPPFLAGS//-D_FORTIFY_SOURCE=?/}
        export CPPFLAGS

	./configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--with-sysroot=${_sysroot}" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
		"--disable-nls" \
		|| return 1
		
	make all || return 1
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install || return 1
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native binutils)
	rm -Rf ${pkgdir}${_sysroot}/share/{man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name 'm68k-atari-mint*' -delete
	
	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/cross/${_target}/;
	cd ${pkgdir}/usr/bin/cross/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done
}

