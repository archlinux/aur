# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='extrae'
pkgdesc='Instrumentation framework to generate execution traces of the most used parallel runtimes (from BSC).'
pkgver='4.3.3.20250926'
libaddr2line_commit=70b1ab0087acf35d5825b2341b2b03cb3cce3e24
pkgrel='2'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL-2.1-or-later')
depends=(openmpi libunwind papi libxml2 zlib python)
source=("https://github.com/bsc-performance-tools/$pkgname/archive/${pkgver%.*}.tar.gz"
        "https://github.com/bsc-performance-tools/libaddr2line/archive/${libaddr2line_commit}.tar.gz"
        extrae-Fix-make-DESTDIR-.-install-for-Extrae-4.0.2.patch
        extrae-Fix-references-to-the-build-directory.patch)
sha512sums=(413446487410a2b4d33c9e1b8270c1e11e4be735c02b6bbee604530a7c068b5a806e2eeb6aafd93eba04d19915c77751dd760b746d2766092c97c3e7e9b79901
            32f564d56e68606b69b262fc055c317aa5986482ccd84cd150fd037d01d0575bd5d70a0fd1fda9f3cd281af70e06472c50ead66e9f6a83f329b305256e9a7dff
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
	export CFLAGS="$CFLAGS -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -Wno-error=int-conversion"

	# Avoid build failures under GCC 15 due to function declarations without parameters
	# (see https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters)
	export CFLAGS="$CFLAGS -std=gnu17"

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
