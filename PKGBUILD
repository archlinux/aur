# Former maintainer: Alexey Ermakov <fufler[at]gmail[dot]com>
# Maintainer: Antoine Viallon <antoine[dot]viallon[at]gmail[dot]com>

pkgname=hpl
pkgver=2.3
pkgrel=2
pkgdesc="A portable implementation of the high-performance Linpack benchmark for distributed-memory computers"
arch=('i686' 'x86_64')
url="http://www.netlib.org/benchmark/hpl/"
license=('custom:bsd')
depends=('openmpi' 'cblas' 'lapack' 'mpich')
makedepends=('git' 'gcc-fortran')
source=("http://www.netlib.org/benchmark/hpl/hpl-${pkgver}.tar.gz" "hpl-${pkgver}-arch.patch")
md5sums=('2789bbadd6d75ae0d64d9b9f2fa8a136'
         '542fcac3a92f9860eb4dd4cb717db865')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/hpl-${pkgver}-arch.patch"
    sed -i "s|\"hpl-${pkgver}.tar.gz\"|\"http://www.netlib.org/benchmark/hpl/hpl-${pkgver}.tar.gz\"|g" www/*.html
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp setup/Make.Linux_PII_CBLAS_gm Make.ompi
    cp setup/Make.Linux_PII_CBLAS_gm Make.mpich

    MPI_BIN=/usr/bin       make TOPdir="`pwd`" arch=ompi ARCH=ompi
    MPI_BIN=/opt/mpich/bin make TOPdir="`pwd`" arch=mpich ARCH=mpich
}

package(){
    install -D -m 0755 "${srcdir}/${pkgname}-${pkgver}/bin/ompi/xhpl" "${pkgdir}/usr/bin/xhpl-ompi"
    install -D -m 0755 "${srcdir}/${pkgname}-${pkgver}/bin/mpich/xhpl" "${pkgdir}/usr/bin/xhpl-mpich"
    install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/bin/ompi/HPL.dat" "${pkgdir}/etc/hpl/HPL.dat"
    install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/hpl/LICENSE"
}
