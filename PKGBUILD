# Submitter: tuxzz <dorazzsoft@gmail.com>
# Maintainer: Jesse Codling <codling@umich.edu>
# Contributor: EntropicEffect <william.grunow93@gmail.com>
pkgname=fftw-amd
_ver=5.1
_fftw=3.3.10
pkgver=${_fftw}amd${_ver}
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) - AMD Ryzen/EPYC Optimized Version"
arch=('x86_64')
license=('GPL2')
url="https://github.com/amd/amd-fftw/"
conflicts=('fftw' 'fftw-openmpi')
provides=(
	fftw=${_fftw}
	fftw-openmpi=${_fftw}
)
provides+=(
	libfftw3q_threads.so
	libfftw3q_omp.so
	libfftw3q.so
	libfftw3l_threads.so
	libfftw3l_omp.so
	libfftw3l.so
	libfftw3f_threads.so
	libfftw3f_omp.so
	libfftw3f.so
	libfftw3_threads.so
	libfftw3_omp.so
	libfftw3.so
	libfftw3l_mpi.so
	libfftw3f_mpi.so
	libfftw3_mpi.so
)
depends=(openmpi)

makedepends=(
	cmake
	gcc-fortran
	openmpi
)

source=(
	"https://github.com/amd/amd-fftw/archive/refs/tags/${_ver}.tar.gz"
)
sha512sums=('4c65aa035883aecfd04b116c690c562dc77f9965638aa1768750ec2b58c0b9addf938f93ba573dae9956f9a34e481d43943927b6441b023e5349219829e6efce')

prepare() {
	rm -r "${pkgname}-${pkgver}" || true
	mv -v amd-fftw-${_ver} "${pkgname}-${pkgver}"
	cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-double"
	cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-double"
	cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-long-double"
	cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-quad"
}

build() {
	export F77='gfortran'
	CFLAGS+=" -ftree-vectorize -fomit-frame-pointer -malign-double -fstrict-aliasing -ffast-math -O3 -Wno-incompatible-pointer-types"
	export CFLAGS=${CFLAGS/-march=x86-64/}
	# don't overwrite CFLAGS, though make sure CPU optimizations can be done
	export FFLAGS="$CFLAGS"
	_default_configure="./configure --prefix=/usr --enable-shared --enable-threads --enable-mpi --enable-openmp --enable-dynamic-dispatcher --enable-amd-opt"

	# configure single precision
	(
		cd "${pkgname}-${pkgver}"
		${_default_configure} --enable-sse2 --enable-avx --enable-avx2 --enable-single --enable-amd-mpifft --enable-amd-fast-planner
	)

	# configure double precision
	(
		cd "${pkgname}-${pkgver}-double"
		${_default_configure} --enable-sse2 --enable-avx --enable-avx2 --enable-amd-mpifft --enable-amd-fast-planner
	)

	# configure long-double precission
	(
		cd "${pkgname}-${pkgver}-long-double"
		${_default_configure} --enable-long-double --enable-amd-mpifft
	)

	# configure quad precision
	(
		cd "${pkgname}-${pkgver}-quad"
		${_default_configure} --disable-mpi --enable-quad-precision
	)

	make -C "${pkgname}-${pkgver}"
	make -C "${pkgname}-${pkgver}-double"
	make -C "${pkgname}-${pkgver}-long-double"
	make -C "${pkgname}-${pkgver}-quad"
}

package() {
	make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}-double"
	make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}-long-double"
	make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}-quad"
	cd "${pkgname}-${pkgver}"
	install -vDm 644 {AUTHORS,ChangeLog,NEWS,TODO,README_AMD.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
