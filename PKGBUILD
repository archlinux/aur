# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

##### Configuration Options
# Specify GPU compute capability Tesla (1.x) or Fermi (2.x) or Kepler (3.x)
_GPU_TARGET=Tesla
#_GPU_TARGET=Fermi
#_GPU_TARGET=Kepler
##### End

pkgname=magma
pkgver=1.4.1
pkgrel=1
pkgdesc="Provides a dense linear algebra library similar to LAPACK but for heterogeneous/hybrid architectures, starting with current 'Multicore+GPU' systems."
arch=("i686" "x86_64")
url="http://icl.cs.utk.edu/magma/"
license=(custom)
depends=("cuda>=5.0.0" "gcc-libs-multilib" "gsl" "python" "acml-gfortran" "cblas")
makedepends=("acml-gfortran")
options=('staticlibs')
sha1sums=('3e6bc7c2d6500508134b6cdf48985f7c8b94c89b')
source=("http://icl.cs.utk.edu/projectsfiles/magma/downloads/magma-${pkgver}.tar.gz")

build() {

	cd ${srcdir}/magma-${pkgver}

	# Fix Makefile
	cp make.inc.acml make.inc
	sed -i "/GPU_TARGET ?=/c GPU_TARGET = ${_GPU_TARGET}" make.inc
	sed -i '/#CUDADIR/c CUDADIR   = /opt/cuda' make.inc
	sed -i '/#ACMLDIR/c ACMLDIR   = /usr/lib/acml/gfortran' make.inc
	sed -i '/#CBLASDIR/c CBLASDIR   = /usr/lib' make.inc
	sed -i 's^_mp^^g' make.inc
	sed -i 's^_mv^^g' make.inc
	sed -i 's^-L$(ACMLDIR)/gfortran64/lib^-L$(ACMLDIR)^g' make.inc
	sed -i 's^-L$(CBLASDIR)/lib^-L$(CBLASDIR)^g' make.inc

	make clean
	make all
	make prefix="${srcdir}/install/" install

	make clean
	sed -i 's^-O3^-fPIC -O3^g' make.inc
	sed -i 's^-fopenmp^-fPIC -fopenmp^g' make.inc
	sed -i '/NVOPTS    =/c NVOPTS    =       -O3 -DADD_ -Xcompiler "-fno-strict-aliasing -fPIC"' make.inc
	make shared
	make prefix="${srcdir}/install/" install
}

package(){
	mkdir -p ${pkgdir}/opt/magma/testing
	cp -ru ${srcdir}/magma-${pkgver}/testing/* ${pkgdir}/opt/magma/testing/
	cp -ru ${srcdir}/install/* ${pkgdir}/opt/magma/

	rm -rf ${pkgdir}/opt/magma/lib/pkgconfig	
	mkdir -p ${pkgdir}/usr/share/licenses/magma
	cp ${srcdir}/magma-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/magma/LICENSE

}
