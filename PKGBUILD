# Submitter: Piotr "utak3r" Borys <piotr.borys@gmail.com>
# Maintainer: Giovanni "ItachiSan" Santini <giovannisantini93@yahoo.it>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname='gcc44-multilib'
pkgver=4.4.7
pkgrel=4
_libstdcppmanver=4.5.2	# Note: check source directory name when updating this
pkgdesc="The GNU Compiler Collection, version 4.4.7 - multilib version"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.21' 'libmpc' 'cloog' 'elfutils' 'dejagnu' 'glibc>=2.11.1-2' 'lib32-glibc>=2.12.1')
conflicts=('gcc44')	# Existing package from AUR
provides=('gcc44')
options=('!libtool' '!buildflags' '!emptydirs' 'staticlibs')
source=(
	# ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++}-${pkgver}.tar.bz2 <- the one over is 'optimized',
	# it chooses the right mirror for you
	http://ftpmirror.gnu.org/gcc/gcc-${pkgver}/gcc-{core,g++}-${pkgver}.tar.bz2
	# If you have problems, use the source below
	# http://ftp.vim.org/languages/gcc/libstdc++/doxygen/libstdc++-api-${_libstdcppmanver}.man.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-api-${_libstdcppmanver}.man.tar.bz2 # can't be automagically resolved, doh
	# Various patches
	gcc_pure64.patch
	gcc-hash-style-both.patch
	siginfo_t_fix.patch
	texinfo_5_fix.patch
	gcc-fix_toplevel_inlines.patch
	)
sha256sums=('c4663b7023909a4a075d3c2b2e17f6e082a9625aebfd0ce7f1d7817e44bf5542'
            '1882ff29be51eeb3fb349cbcda9df200a5c3cd20c97dd1d593101e0998b3c469'
            '3298757bedcf8b60f6e9b2d9aea75aac527199c6866d1b6218f706f20563b9e2'
            '59d7a0b897e0a6e4e126319d2c4db770fe4531e5700bb7c320f0075935078204'
            'a600550d3d2b2fb8ee6a547c68c3a08a2af7579290b340c35ee5598c9bb305a5'
            '24cb033fa363148952b5ed7cdff635fbee0ae55ecafe5dfa32206e97cb0c4af3'
            '4f4d16d98d72c29ebccdda6a89d65fcd9357703c97c3fca65080ae3e7add762c'
            '9a43d0dfb398dc0dd42f05059718dc5ee9ab8bcf7eaf5234e420f5d3ceb8c8c5')

prepare(){

	cd ${srcdir}/gcc-${pkgver}

	# "Add" ppl-0.11 compatibility
	sed -i "/ppl_minor_version=/s#10#11#" configure
	# Do not install libiberty
	sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
	# Do not run fixincludes
	#sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

	if [ "${CARCH}" = "x86_64" ]; then
		patch -Np1 -i ${srcdir}/gcc_pure64.patch
	fi

	patch -Np1 -i ${srcdir}/siginfo_t_fix.patch
	patch -Np0 -i ${srcdir}/gcc-hash-style-both.patch
	patch -Np1 -i ${srcdir}/texinfo_5_fix.patch
	patch -Np1 -i ${srcdir}/gcc-fix_toplevel_inlines.patch

	echo ${pkgver} > gcc/BASE-VER
}

build() {

	cd ${srcdir}
	rm -rf gcc-build
	mkdir gcc-build
	cd gcc-build
	${srcdir}/gcc-${pkgver}/configure \
		--prefix=/usr \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--with-bugurl=https://github.com/ItachiSan/linux_packaging/issues/ \
		--enable-languages=c,c++ \
		--enable-shared \
		--enable-threads=posix \
		--enable-__cxa_atexit \
		--enable-clocale=gnu \
		--enable-gnu-unique-object \
		--enable-lto \
		--enable-plugin \
		--enable-gold \
		--with-plugin-ld=ld.gold \
		--enable-multilib \
		--disable-libstdcxx-pch \
		--with-system-zlib \
		--with-ppl \
		--with-cloog \
		--disable-libunwind-exceptions \
		--enable-linker-build-id \
		--enable-cloog-backend=isl \
		--enable-ld=default \
		--enable-checking=release \
		--disable-werror \
		--program-suffix=-4.4 \
		--enable-version-specific-runtime-libs

	make

	# increase stack size to prevent test failures
	# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
	# ulimit -s 32768

	# do not abort on error as some are "expected"
	# make -k check || true
	# ${_basedir}/contrib/test_summary
}

# Used the same package() as gcc45 (AUR).
package(){

	cd ${srcdir}/gcc-build

	make DESTDIR=${pkgdir} install

	## Lazy way of dealing with conflicting man and info pages and locales...
	rm -rf ${pkgdir}/usr/share/

	install -Dm644 ${srcdir}/gcc-${pkgver}/COPYING.RUNTIME \
	${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}

