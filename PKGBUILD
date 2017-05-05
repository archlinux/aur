# Maintainer: epitron <chris@ill-logic.com>
# Contributor: pingplug <pingplug@foxmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

##### Configuration Options
# Set to latest CUDA target
_GPU_TARGET=sm50
##### End

pkgname=magma-atlas
pkgver=2.2.0
pkgrel=1
pkgdesc="A dense linear algebra library, similar to LAPACK, for doing caluclations on GPUs and CPUs simultaneously (built against CUDA and atlas-lapack)"
arch=("i686" "x86_64")
url="http://icl.cs.utk.edu/magma/"
provides=(magma)
conflicts=('magma')
license=(custom)
depends=("cuda>=5.5.0" "gcc-libs-multilib" "gsl" "python" "cblas" "atlas-lapack")
options=('staticlibs')
sha256sums=('df5d4ace417e5bf52694eae0d91490c6bde4cde1b0da98e8d400c5c3a70d83a2')
source=("http://icl.cs.utk.edu/projectsfiles/magma/downloads/magma-${pkgver}.tar.gz")

build() {
	cd ${srcdir}/magma-${pkgver}

	# Fix Makefile
	# cp make.inc.openblas make.inc

	cp make.inc-examples/make.inc.atlas make.inc
	sed -i "/#GPU_TARGET ?=/c GPU_TARGET = ${_GPU_TARGET}" make.inc
	sed -i '/#LAPACKDIR ?=/c LAPACKDIR ?= /usr' make.inc
	sed -i '/#CUDADIR/c CUDADIR   = /opt/cuda' make.inc
	sed -i '/#ATLASDIR/c ATLASDIR ?= /usr' make.inc
	sed -i '/#FPIC/c FPIC = -fPIC' make.inc
	sed -i 's/^FFLAGS/CXXFLAGS  = $(CFLAGS)\nFFLAGS/g ' make.inc
	sed -i 's/ -lifcore//g' make.inc
	sed -i 's^-L$(OPENBLASDIR)/lib^-L$(OPENBLASDIR)^g' make.inc

	make clean
	make lib
	#make test
	make sparse
}

package() {
	cd ${srcdir}/magma-${pkgver}
	make prefix="${pkgdir}/opt/magma" install

	mkdir -p ${pkgdir}/opt/magma/example
	cp -ru ${srcdir}/magma-${pkgver}/example/* ${pkgdir}/opt/magma/example/

	#mkdir -p ${pkgdir}/opt/magma/testing
	#cp -ru ${srcdir}/magma-${pkgver}/testing/* ${pkgdir}/opt/magma/testing/

	rm -rf ${pkgdir}/opt/magma/lib/pkgconfig
	mkdir -p ${pkgdir}/usr/share/licenses/magma
	cp ${srcdir}/magma-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/magma/LICENSE
}
