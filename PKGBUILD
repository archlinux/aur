# Maintainer: Alexey Ermakov <fufler[at]gmail[dot]com>

pkgname=hpl
pkgver=2.1
pkgrel=1
pkgdesc="A portable implementation of the high-performance Linpack benchmark for distributed-memory computers"
arch=('i686' 'x86_64')
url="http://www.netlib.org/benchmark/hpl/"
license=('custom:bsd')
depends=('openmpi' 'cblas' 'lapack')
makedepends=('git')
source=("http://www.netlib.org/benchmark/hpl/hpl-${pkgver}.tar.gz" "hpl-${pkgver}-arch.patch")
md5sums=('091aa58c3e62bdf598b403420d8387ef' 'bed9f02937529d6e30441fe4faf8ffd7')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/hpl-${pkgver}-arch.patch"
    sed -i "s|\"hpl-${pkgver}.tar.gz\"|\"http://www.netlib.org/benchmark/hpl/hpl-${pkgver}.tar.gz\"|g" www/*.html
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp setup/Make.Linux_PII_CBLAS_gm Make.mpicc
    make TOPdir="`pwd`" arch=mpicc ARCH=mpicc DESTDIR="$pkgdir/"
}

package(){
    install -D -m 0755 "${srcdir}/${pkgname}-${pkgver}/bin/mpicc/xhpl" "${pkgdir}/usr//bin/xhpl"
    install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/bin/mpicc/HPL.dat" "${pkgdir}/etc/hpl/HPL.dat"
    install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/hpl/LICENSE"
}
