# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname=cross-mipsel-linux-gnu-gcc91
_pkgname=gcc
_target="mipsel-linux-gnu"
pkgver=9.1.0
pkgrel=1
pkgdesc="The GNU Compiler Collection for the MIPS architecture"
url="https://www.gnu.org/software/gcc/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libmpc' 'xz' "cross-${_target}-binutils")
makedepends=('gmp' 'mpfr')
conflicts=('cross-mipsel-linux-gnu-gcc')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=("ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0')
_sysroot="/usr/lib/cross-${_target}"

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	# Hack - see native package for details
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	./configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--with-sysroot=${_sysroot}" \
		"--target=${_target}" \
		--oldincludedir=/../../../usr/include \
		--with-gnu-as --with-gnu-ld \
		--disable-nls --disable-threads \
		--enable-languages=c,c++ \
		--disable-multilib --disable-libgcj \
		--enable-lto --disable-werror \
		--without-headers --disable-shared
	
	make all-gcc "inhibit_libc=true"
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	make DESTDIR=${pkgdir} install-gcc
	
	msg "Removing duplicate files..."
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
