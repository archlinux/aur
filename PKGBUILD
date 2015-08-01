# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

##### Configuration Options
# Specify GPU compute capability Tesla (1.x) or Fermi (2.x) or Kepler (3.x)
#_GPU_TARGET=Tesla
#_GPU_TARGET=Fermi
_GPU_TARGET=Kepler
##### End

pkgname=magma
pkgver=1.6.2
pkgrel=1
pkgdesc="Provides a dense linear algebra library similar to LAPACK but for heterogeneous/hybrid architectures, starting with current 'Multicore+GPU' systems."
arch=("i686" "x86_64")
url="http://icl.cs.utk.edu/magma/"
license=(custom)
depends=("cuda>=5.0.0" "gcc-libs-multilib" "gsl" "python" "cblas")
options=('staticlibs')
sha1sums=('121bedf6c9fa2243b67fb5ee501a86d566c97a93')
source=("http://icl.cs.utk.edu/projectsfiles/magma/downloads/magma-${pkgver}.tar.gz")

build() {
	cd ${srcdir}/magma-${pkgver}

	# Fix Makefile
	cp make.inc.openblas make.inc
	sed -i "/#GPU_TARGET ?=/c GPU_TARGET = ${_GPU_TARGET}" make.inc
	sed -i '/#CUDADIR/c CUDADIR   = /opt/cuda' make.inc
	sed -i '/#OPENBLASDIR/c OPENBLASDIR   = /usr/lib' make.inc
    sed -i 's/^FFLAGS/CXXFLAGS  = $(CFLAGS)\nFFLAGS/g ' make.inc
	sed -i 's^-L$(OPENBLASDIR)/lib^-L$(OPENBLASDIR)^g' make.inc

	make clean
	make shared
	make prefix="${srcdir}/install/" install
}

check() {
    msg "Making testing"
    cd ${srcdir}/magma-${pkgver}
    make testing
}

package() {
	mkdir -p ${pkgdir}/opt/magma/testing
	cp -ru ${srcdir}/magma-${pkgver}/testing/* ${pkgdir}/opt/magma/testing/
	cp -ru ${srcdir}/install/* ${pkgdir}/opt/magma/

	rm -rf ${pkgdir}/opt/magma/lib/pkgconfig	
	mkdir -p ${pkgdir}/usr/share/licenses/magma
	cp ${srcdir}/magma-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/magma/LICENSE
}
