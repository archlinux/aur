# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>
# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=astrometry.net
pkgver=0.80
pkgrel=1
pkgdesc="Automatic recognition of astronomical images"
arch=('i686' 'x86_64')
url="http://astrometry.net/"
license=("GPL")
depends=('bzip2' 'cairo' 'libpng' 'libjpeg-turbo' 'python-astropy' 'netpbm' 'cfitsio' 'gsl' 'swig')
backup=(etc/astrometry.cfg)
install=astrometry.net.install
source=("http://astrometry.net/downloads/astrometry.net-${pkgver}.tar.gz")
_pyver=$(python -V | cut -c 8-10)

prepare() {
    cd astrometry.net-${pkgver}
    sed -e 's/NETPBM_INC\ ?=/NETPBM_INC\ ?=\ -I\/usr\/include\/netpbm/g' -i util/makefile.netpbm
    sed -e 's/-L.\ -lnetpbm/-L\/usr\/lib\ -lnetpbm/g' -i util/makefile.netpbm
}

build() {
    cd ${pkgname}-${pkgver}
    make SYSTEM_GSL=yes all py extra
}

package() {
    cd astrometry.net-${pkgver}

    make INSTALL_DIR="${pkgdir}/usr" \
         ETC_INSTALL_DIR="${pkgdir}/etc" \
         DOC_INSTALL_DIR="${pkgdir}/usr/share/doc/astrometry" \
         EXAMPLE_INSTALL_DIR="${pkgdir}/usr/share/astrometry/examples" \
         DATA_INSTALL_DIR="${pkgdir}/usr/share/astrometry/data" \
         PY_BASE_INSTALL_DIR="${pkgdir}/usr/lib/python${_pyver}/site-packages/astrometry" \
         PY_BASE_LINK_DIR="../lib/python${_pyver}/site-packages/astrometry" \
         install

    sed -e "s|${pkgdir}/usr/data|/usr/share/astrometry/data|" -i ${pkgdir}/etc/astrometry.cfg
    rm ${pkgdir}/usr/share/doc/astrometry/report.txt
    rm ${pkgdir}/usr/bin/fitscopy
    rm ${pkgdir}/usr/bin/imcopy
}
md5sums=('e76b8b1c5eec494958ede884717f1865')
