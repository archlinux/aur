# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

pkgname=starpu
pkgdesc="Task programming library for hybrid architectures"
url="https://starpu.gitlabpages.inria.fr/"
pkgver=1.3.9
pkgrel=3
arch=(x86_64 x86_64_v3)
source=(
	https://files.inria.fr/starpu/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz{,.asc}
)
md5sums=('f4ac75be44033220a0d38e843a2c1fed'
         'SKIP')
validpgpkeys=(
	CA89802221770FC90C8D1A4538A9570385E6E772 # Nathalie Furmento <nathalie.furmento@labri.fr>
)
license=(LGPL3)
makedepends=(
	valgrind
	openmpi
	binutils
	openblas-lapack
	intel-mkl
	numactl
)

depends=(
	cuda
	magma
	hdf5
	glpk
	ocl-icd
	simgrid
)

prepare() {
	cd "${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--enable-simgrid \
		--enable-mpi \
		--enable-shared \
		--disable-static \
		--disable-nmad \
		--enable-valgrind \
		--enable-hdf5 \
		--enable-cuda \
		--with-cuda-dir=${CUDA_PATH:-/opt/cuda} \
		--enable-cpu \
		--enable-opencl \
		--disable-poti \
		--enable-perf-debug \
		--enable-glpk \
		--enable-openmp \
		--disable-build-examples \
		--enable-build-tests \
		--with-pic \
		--enable-blas-lib=mkl \
		LDFLAGS="${LDFLAGS}" \
		CFLAGS="${CFLAGS}"
}

build() {
	cd "${pkgname}-${pkgver}"

	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

#check() {
#	cd "${pkgname}-${pkgver}"
#
#	make check
#}

