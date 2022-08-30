# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='extrae'
pkgdesc='Instrumentation framework to generate execution traces of the most used parallel runtimes (from BSC).'
pkgver='4.0.1.20220513'
pkgrel='4'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(openmpi libunwind papi libxml2 zlib python)
source=("https://github.com/bsc-performance-tools/$pkgname/archive/${pkgver%.*}.tar.gz"
        extrae-issue-27-fix-pie-address-translation.patch
        extrae-Fix-references-to-the-build-directory.patch)
sha512sums=(58cbe06b1eb738dba3c9d38a96ca8a9bf442c492214e086876af25b8d7e01c379b46281f6815763e87e0e69214636f95486d48b1b6ce088b54d24b4d77ff0920
            3b0fae157fcc6e85be3a5565c2ea3abe8bf35e130de96435a93ba7b3f4b6c30df8982823d36c494633a2c16671664112558393faeead05226b96aa521bb14fba
            a5085d4e974a98cb6266502e06bd2b5a45e213f7d322e8f6cffccbaf92a7f414641b6e6578f87f76dbbb3e4f89b3c268dc33e813c13ea5512e52d1b241317f2a)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# Replace PTR type (from ansidecl.h) which was recently removed from binutils
	sed -i 's|PTR|void *|g' src/merger/common/bfd_manager.c

	# Upstream issue: https://github.com/bsc-performance-tools/extrae/issues/27
	patch -Np1 -i "$srcdir/extrae-issue-27-fix-pie-address-translation.patch"
	patch -Np1 -i "$srcdir/extrae-Fix-references-to-the-build-directory.patch"

	# The OpenMPI package also has a library called libompitrace, which conflicts with
	# extrae's version - rename extrae's version to libextraeompitrace to avoid the clash
	sed -ie 's/libompitrace/libextraeompitrace/g' example/LINUX/MPI+OMP/ld-preload/trace.sh scripts/mpitrace_wizard src/tracer/Makefile.am

	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# OpenMPI library path changed between openmpi 4.1.2-1 and 4.1.3-1
	# Autodetect which one it is to smoothen transition
	[ -e /usr/lib/openmpi/libmpi.so ] && MPILIBPATH=/usr/lib/openmpi || MPILIBPATH=/usr/lib

	# NOTE: The following optional features are NOT enabled:
	# * Automatic instrumentation (with dyninst)
	# * CUDA support
	# * OpenCL support
	# * LaTeX documentation
	# NOTE: Normally LibXML is correctly autodetected, so forcing the LibXML
	#       prefix should not be necessary, however, there's some homebrew LibXML
	#       detection logic (look for AX_PROG_XML2 in config/macros.m4) which
	#       fails in some scenarios, such as if /bin is before /usr/bin in PATH
	#       (thanks to @teleportex on AUR for the report and fix suggestion)
	./configure \
		--prefix=/usr \
		--with-mpi=/usr \
		--with-mpi-libs="$MPILIBPATH" \
		--with-mpi-headers=/usr/include/openmpi \
		--with-unwind=/usr \
		--with-unwind-headers=/usr/include \
		--with-unwind-libs=/usr/lib \
		--with-papi=/usr \
		--with-papi-headers=/usr/include \
		--with-papi-libs=/usr/lib \
		--without-dyninst \
		--with-xml-prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	make DESTDIR="$pkgdir/" install
}
