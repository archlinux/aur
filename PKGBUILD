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
pkgver=2.1.0
pkgrel=1
pkgdesc="Provides a dense linear algebra library similar to LAPACK but for heterogeneous/hybrid architectures, starting with current 'Multicore+GPU' systems. (with CUDA)"
arch=("i686" "x86_64")
url="http://icl.cs.utk.edu/magma/"
license=(custom)
depends=("cuda>=6.5.0" "gcc-libs-multilib" "gsl" "python" "cblas")
options=('staticlibs')
sha1sums=('8bf2dce79bc55e414aae0bc858956f8bd08b9c91')
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

    # FIXME: there is no shared library
    #mkdir build && cd build
    #cmake -DGPU_TARGET=${_GPU_TARGET} \
    #    -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc \
    #    -DCMAKE_INSTALL_PREFIX=/opt/magma ..
    #make
}

package() {
    cd "${srcdir}/magma-${pkgver}"
    make prefix="${pkgdir}/opt/magma" install

    #cd "${srcdir}/magma-${pkgver}/build"
    #make DESTDIR="${pkgdir}" install

    mkdir -p ${pkgdir}/opt/magma/example
    cp -ru ${srcdir}/magma-${pkgver}/example/* ${pkgdir}/opt/magma/example/

    mkdir -p ${pkgdir}/opt/magma/testing
    cp -ru ${srcdir}/magma-${pkgver}/testing/* ${pkgdir}/opt/magma/testing/

    rm -rf ${pkgdir}/opt/magma/lib/pkgconfig
    mkdir -p ${pkgdir}/usr/share/licenses/magma
    cp ${srcdir}/magma-${pkgver}/COPYRIGHT ${pkgdir}/usr/share/licenses/magma/LICENSE
}
