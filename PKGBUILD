# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Shengqi Chen <i at harrychen dot xyz>
# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname=cross-mipsel-linux-gnu-gcc
_pkgname=gcc
_target="mipsel-linux-gnu"
pkgver=12.1.0
pkgrel=2
pkgdesc="The GNU Compiler Collection for the MIPS architecture"
url="https://www.gnu.org/software/gcc/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libmpc' 'xz' "cross-${_target}-binutils")
makedepends=('gmp' 'mpfr')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=(
	"ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.xz"
	#"ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.xz.sig"
)
sha256sums=(
	'62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b'
	#'f5dba6de2221ea625acae85f97be9dcf550c8125f545372dbaf53e83ebcbeb0d'
)
_sysroot="/usr/lib/cross-${_target}"

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	# Hack - see native package for details
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	export CFLAGS="${CFLAGS// -Werror=format-security}"
	export CXXFLAGS="$CFLAGS"

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
