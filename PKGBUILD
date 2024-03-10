# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='extrae'
pkgdesc='Instrumentation framework to generate execution traces of the most used parallel runtimes (from BSC).'
pkgver='4.0.6.20230802'
pkgrel='2'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(openmpi libunwind papi libxml2 zlib python)
source=("https://github.com/bsc-performance-tools/$pkgname/archive/${pkgver%.*}.tar.gz"
        extrae-issue-27-fix-pie-address-translation.patch
        extrae-Fix-make-DESTDIR-.-install-for-Extrae-4.0.2.patch
        extrae-Fix-references-to-the-build-directory.patch)
sha512sums=(42531b95fea8955133ac32abc739de56cd08845b29afb0282c0971a660f78e81c719ea853c22c8a7d9ce184a0562869e358bc02a970d153a5d3380d87c70a688
            ce6e5f3994118783fd1e05de7336782e4df4eaf3b2a277174ea536b0d391f418cb36682c1e1b3adee3b4d2aa07f25af58998525c79d0567f7afa88dda048c413
            e90d108ac4531d68ba8bced44db71139cb7b4273f97ec994582150eb9d4f71960c525c1b3ad2fac95d678f91494b5299bfb00513a0a58cc5b6d916eb930af2d5
            a5085d4e974a98cb6266502e06bd2b5a45e213f7d322e8f6cffccbaf92a7f414641b6e6578f87f76dbbb3e4f89b3c268dc33e813c13ea5512e52d1b241317f2a)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# Upstream issue: https://github.com/bsc-performance-tools/extrae/issues/27
	patch -Np1 -i "$srcdir/extrae-issue-27-fix-pie-address-translation.patch"

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
	export CFLAGS="$CFLAGS -Wno-error=incompatible-pointer-types -Wno-error=int-conversion -Wno-error=implicit-function-declaration"

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
