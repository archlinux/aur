# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

##### Configuration Options
# Specify GPU compute capability Fermi (2.x) or Kepler (3.x) or Maxwell (5.x)
#_GPU_TARGET=Fermi
#_GPU_TARGET=Kepler
#_GPU_TARGET=Maxwell
# Can also be one of these: sm20 sm30 sm35 sm50
_GPU_TARGET=sm30
##### End

pkgname=magma
pkgver=2.0.0
pkgrel=1
pkgdesc="Provides a dense linear algebra library similar to LAPACK but for heterogeneous/hybrid architectures, starting with current 'Multicore+GPU' systems. (with CUDA)"
arch=("i686" "x86_64")
url="http://icl.cs.utk.edu/magma/"
license=(custom)
depends=("cuda>=6.5.0" "gcc-libs-multilib" "gsl" "python" "cblas")
options=('staticlibs')
sha1sums=('5d039250c03ec4e9e197a2826b71015402dbe60b')
source=("http://icl.cs.utk.edu/projectsfiles/magma/downloads/magma-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/magma-${pkgver}"

    # Fix Makefile
    cp make.inc.openblas make.inc
    sed -i "/#GPU_TARGET ?=/c GPU_TARGET = ${_GPU_TARGET}" make.inc
    sed -i '/#CUDADIR/c CUDADIR   = /opt/cuda' make.inc
    sed -i '/#OPENBLASDIR/c OPENBLASDIR   = /usr/lib' make.inc
    sed -i 's^-L$(OPENBLASDIR)/lib^-L$(OPENBLASDIR)^g' make.inc

    make clean
    make lib
    #make test
    make sparse

    # FIXME: there is no install target
    #mkdir build && cd build
    #cmake -DGPU_TARGET=${_GPU_TARGET} ..
    #make
}

package() {
    cd "${srcdir}/magma-${pkgver}"
    make prefix="${pkgdir}/opt/magma" install

    mkdir -p ${pkgdir}/opt/magma/example
    cp -ru ${srcdir}/magma-${pkgver}/example/* ${pkgdir}/opt/magma/example/

    mkdir -p ${pkgdir}/opt/magma/testing
    cp -ru ${srcdir}/magma-${pkgver}/testing/* ${pkgdir}/opt/magma/testing/

    rm -rf ${pkgdir}/opt/magma/lib/pkgconfig
    mkdir -p ${pkgdir}/usr/share/licenses/magma
    cp ${srcdir}/magma-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/magma/LICENSE
}
