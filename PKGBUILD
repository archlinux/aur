# $Id$
# Maintainer: Peter Strapp <peter at strapp.co.uk>
# Contributor: Peter Strapp <peter at strapp.co.uk>

pkgname=astrometrynet
pkgver=0.66
pkgrel=1
pkgdesc="Astrometry.net plate-solving"
url="http://astrometry.net/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('gsl' 'cfitsio' 'netpbm' 'wcslib' 'cairo' 'libjpeg-turbo' 'libpng' 'zlib' 'python2-astropy')
install=astrometrynet.install
source=("http://astrometry.net/downloads/astrometry.net-${pkgver}.tar.gz")
sha1sums=('c373002fe1a6a0d98d3c44c127714a6e71c04d08')

prepare() {
  cd astrometry.net-${pkgver}
  sed -e 's/python/python2/' -i util/makefile.common blind/Makefile util/Makefile sdss/Makefile
}

build() {
  cd astrometry.net-${pkgver}
  make NETPBM_INC="-I/usr/include/netpbm/" NETPBM_LIB="-L/usr/lib -lnetpbm"
}

package() {
  cd astrometry.net-${pkgver}

  make INSTALL_DIR="${pkgdir}/usr" \
       ETC_INSTALL_DIR="${pkgdir}/etc" \
       EXAMPLE_INSTALL_DIR="${pkgdir}/usr/share/astrometry/examples" \
       DATA_INSTALL_DIR="${pkgdir}/usr/share/astrometry/data" \
       PY_BASE_INSTALL_DIR="${pkgdir}/usr/lib/python2.7/astrometry" \
       PY_BASE_LINK_DIR="../lib/python2.7/astrometry" \
       install

  cd ${pkgdir}; grep -r -l "/usr/bin/env python" . | xargs sed -i 's|/usr/bin/env python|/usr/bin/env python2|'
  sed -e "s|${pkgdir}/usr/data|/usr/share/astrometry/data|" -i ${pkgdir}/etc/astrometry.cfg
  rm ${pkgdir}/usr/doc/report.txt
}
