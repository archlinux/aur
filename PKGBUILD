# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>
# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=astrometry.net
pkgver=0.93
pkgrel=1
pkgdesc="Automatic recognition of astronomical images"
arch=('i686' 'x86_64')
url="http://astrometry.net"
license=("GPL")
depends=('bzip2' 'cairo' 'libpng' 'libjpeg-turbo' 'python-astropy' 'netpbm' 'cfitsio' 'gsl' 'swig')
backup=(etc/astrometry.cfg)
install=astrometry.net.install
source=("http://astrometry.net/downloads/${pkgname}-${pkgver}.tar.gz")

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd astrometry.net-${pkgver}
    sed -e 's/NETPBM_INC\ ?=/NETPBM_INC\ ?=\ -I\/usr\/include\/netpbm/g' \
        -e 's/-L.\ -lnetpbm/-L\/usr\/lib\ -lnetpbm/g' -i util/makefile.netpbm
}

build() {
    cd ${pkgname}-${pkgver}
    make -C util config
    make SYSTEM_GSL=yes all
    make SYSTEM_GSL=yes py
    make SYSTEM_GSL=yes extra
}

package() {
    cd astrometry.net-${pkgver}

    make INSTALL_DIR="${pkgdir}/usr" \
         ETC_INSTALL_DIR="${pkgdir}/etc" \
         DOC_INSTALL_DIR="${pkgdir}/usr/share/doc/astrometry" \
         EXAMPLE_INSTALL_DIR="${pkgdir}/usr/share/astrometry/examples" \
         DATA_INSTALL_DIR="${pkgdir}/usr/share/astrometry/data" \
         PY_BASE_INSTALL_DIR="${pkgdir}/usr/lib/python$(get_pyver .)/site-packages/astrometry" \
         PY_BASE_LINK_DIR="../lib/python$(get_pyver .)/site-packages/astrometry" \
         install

    sed -e "s|${pkgdir}/usr/data|/usr/share/astrometry/data|" -i ${pkgdir}/etc/astrometry.cfg
    rm ${pkgdir}/usr/share/doc/astrometry/report.txt
    rm ${pkgdir}/usr/bin/fitscopy
    rm ${pkgdir}/usr/bin/imcopy
}
md5sums=('a4d58d6602f02c5f84b5c8de810b8eee')
