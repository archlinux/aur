# Contributor: SebRmv <sbriais at-symbol free dot fr> 
# PKGBUILD based on mipsel-linux-gnu-gcc
# (made by: Vojtech Horky <vojta . horky at-symbol seznam . cz>)
pkgname=m68k-atari-mint-gcc
_pkgname=gcc
_target="m68k-atari-mint"
pkgver=4.6.4
pkgrel=5
pkgdesc="The GNU Compiler Collection for the Motorola M68000 architecture"
url="http://www.gnu.org/software/gcc/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mpfr' 'sh' "m68k-atari-mint-binutils" 'cloog' 'ppl')
replaces=('cross-m68k-atari-mint-gcc')
provides=('m68k-atari-mint-gcc-core')
conflicts=('cross-m68k-atari-mint-gcc' 'cross-m68k-atari-mint-gcc-core' 'm68k-atari-mint-gcc-core')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip' 'staticlibs')
source=("ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.bz2" "gcc-4.6.4-mint-20130415.patch.bz2")
sha1sums=('63933a8a5cf725626585dbba993c8b0f6db1335d' 'bd2e88f2b862cc404f47144fb67375b1fe17291b')
_sysroot="/usr/lib/${_target}"


prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}

        patch -Np1 < ../gcc-4.6.4-mint-20130415.patch
}

build() {
	mkdir -p ${srcdir}/build

	cd ${srcdir}/build

        CFLAGS=${CFLAGS//-D_FORTIFY_SOURCE=?/}
        export CFLAGS
        
        CPPFLAGS=${CPPFLAGS//-D_FORTIFY_SOURCE=?/}
        export CPPFLAGS
	
	../${_pkgname}-${pkgver}/configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
        	--disable-nls --disable-threads \
        	--enable-languages="c,c++" \
        	--disable-libgcj \
        	--disable-shared \
        	--disable-libstdcxx-pch \
        	CFLAGS_FOR_TARGET="-O2 -fomit-frame-pointer" \
        	CXXFLAGS_FOR_TARGET="-O2 -fomit-frame-pointer" \
		|| return 1
	
	make all-gcc "inhibit_libc=true" || return 1
	
   	make all-target-libgcc || return 1
}

package() {
	cd ${srcdir}/build

	make DESTDIR=${pkgdir} install-gcc || return 1
	make DESTDIR=${pkgdir} install-target-libgcc || return 1

	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native gcc)
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

        mkdir -p ${pkgdir}/usr/lib/${_target}/lib/gcc/${_target}/${pkgver}/m68000
        cd ${pkgdir}/usr/lib/${_target}/lib/gcc/${_target}/${pkgver}/m68000
        ln -s ../libgcc.a .
        ln -s ../libgcov.a .
}

