# Contributor: Eole Dev < Eole Dev at-symbol outlook . fr>
pkgname=cross-mips-elf-gcc
_pkgname=gcc
_target="mips-elf"
pkgver=5.2.0
pkgrel=1
pkgdesc="The GNU Compiler Collection for the MIPS-elf architecture"
url="http://www.gnu.org/software/gcc/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mpfr' 'gmp' 'libmpc' 'sh' "cross-${_target}-binutils")
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=("ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('a51bcfeb3da7dd4c623e27207ed43467')
_sysroot="/usr/lib/cross-${_target}"

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}
}

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	./configure \
		--prefix=${_sysroot} \
		--bindir=/usr/bin --program-prefix=${_target}- \
		--with-sysroot=${_sysroot} \
		--target=${_target} \
		--with-gnu-as --with-gnu-ld 
	
	make all-gcc 
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	make DESTDIR=${pkgdir} install-gcc
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native gcc)
	rm -Rf ${pkgdir}${_sysroot}/{man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name "${_target}-*" -delete
	
	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/cross/${_target}/;
	cd ${pkgdir}/usr/bin/cross/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done
}
