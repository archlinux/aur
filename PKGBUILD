# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='extrae'
pkgdesc='Instrumentation framework to generate execution traces of the most used parallel runtimes (from BSC).'
pkgver='5.0.0.20251201'
libaddr2line_commit=2c580cba4764faf5605592ae201f892df937ef12
pkgrel='2'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL-2.1-or-later')
depends=(openmpi libunwind papi libxml2 zlib python)
source=("https://github.com/bsc-performance-tools/$pkgname/archive/${pkgver%.*}.tar.gz"
        "https://github.com/bsc-performance-tools/libaddr2line/archive/${libaddr2line_commit}.tar.gz"
        extrae-Fix-make-DESTDIR-.-install-for-Extrae-4.0.2.patch
        extrae-Fix-references-to-the-build-directory.patch)
sha512sums=(796ef0a4adbc5dd1009d1ed0bdfcffaab350bced78ffab0557483d9cd0aa683809e10a876344e054bd1668fa1eeff59f05d51672e834d4a898186f30dd4dfe24
            1fe33bd210ad770921ca5af6d3ee5b9f530448a79b17f52546a43ae4c8afbdc9fe81a1209af9526eb8690548ded44a3c5c0aa7e4ce6214723e191953bf591c32
            e90d108ac4531d68ba8bced44db71139cb7b4273f97ec994582150eb9d4f71960c525c1b3ad2fac95d678f91494b5299bfb00513a0a58cc5b6d916eb930af2d5
            a5085d4e974a98cb6266502e06bd2b5a45e213f7d322e8f6cffccbaf92a7f414641b6e6578f87f76dbbb3e4f89b3c268dc33e813c13ea5512e52d1b241317f2a)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	rm -df libaddr2line
	ln -s "../libaddr2line-${libaddr2line_commit}/" libaddr2line

	patch -Np1 -i "$srcdir/extrae-Fix-make-DESTDIR-.-install-for-Extrae-4.0.2.patch"
	patch -Np1 -i "$srcdir/extrae-Fix-references-to-the-build-directory.patch"

	# The OpenMPI package also has a library called libompitrace, which conflicts with
	# extrae's version - rename extrae's version to libextraeompitrace to avoid the clash
	sed -ie 's/libompitrace/libextraeompitrace/g' example/LINUX/MPI+OMP/ld-preload/trace.sh scripts/mpitrace_wizard src/tracer/Makefile.am

	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# For now, ignore new errors from GCC 14 (see https://gcc.gnu.org/gcc-14/porting_to.html)
	export CFLAGS="$CFLAGS -Wno-error=incompatible-pointer-types -Wno-error=int-conversion"

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
		--with-binutils=/usr \
		--with-binutils-headers=/usr/include \
		--with-binutils-libs=/usr/lib \
		--with-mpi=/usr \
		--with-mpi-libs=/usr/lib \
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
