# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Shengqi Chen <i at harrychen dot xyz>
# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname=cross-mipsel-linux-gnu-gcc
_pkgname=gcc
_target="mipsel-linux-gnu"
pkgver=12.2.0
pkgrel=2
pkgdesc="The GNU Compiler Collection for the MIPS architecture"
url="https://www.gnu.org/software/gcc/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libmpc' 'xz' "cross-${_target}-binutils")
makedepends=('gmp' 'mpfr')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=(ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=(
	'e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff'
	'1a017479ebeff63777f0854c753dcd8f622c642a31158db43819bf19b59ec831'
)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
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
