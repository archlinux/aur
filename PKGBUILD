# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
# Contributor: 天苯 <universebenzene at sina dot com>
pkgname=astrometry.net
pkgver=0.70
pkgrel=1
pkgdesc="Automatic recognition of astronomical images"
arch=('i686' 'x86_64')
url="http://astrometry.net/"
license=("GPL")
depends=('bzip2' 'cairo' 'libpng' 'libjpeg-turbo' 'python2' 'python2-astropy'
'python2-numpy' 'netpbm' 'cfitsio' 'gsl')
makedepends=('make' 'gcc')
backup=(etc/astrometry.cfg)
install=astrometry.net.install
source=("https://github.com/dstndstn/${pkgname}/archive/${pkgver}.tar.gz")

prepare() {
  cd astrometry.net-${pkgver}
  sed -e 's/NETPBM_INC\ ?=/NETPBM_INC\ ?=\ -I\/usr\/include\/netpbm/g' -i util/makefile.netpbm
  sed -e 's/-L.\ -lnetpbm/-L\/usr\/lib\ -lnetpbm/g' -i util/makefile.netpbm
  sed -e 's/python/python2/' -i util/makefile.common blind/Makefile util/Makefile sdss/Makefile libkd/Makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make SYSTEM_GSL=yes PYTHON=/usr/bin/python2 all py extra
}

package() {
  cd astrometry.net-${pkgver}

  make INSTALL_DIR="${pkgdir}/usr" \
       ETC_INSTALL_DIR="${pkgdir}/etc" \
       DOC_INSTALL_DIR="${pkgdir}/usr/share/doc/astrometry" \
       EXAMPLE_INSTALL_DIR="${pkgdir}/usr/share/astrometry/examples" \
       DATA_INSTALL_DIR="${pkgdir}/usr/share/astrometry/data" \
       PY_BASE_INSTALL_DIR="${pkgdir}/usr/lib/python2.7/site-packages/astrometry" \
       PY_BASE_LINK_DIR="../lib/python2.7/site-packages/astrometry" \
       install

  cd ${pkgdir}; grep -r -l "/usr/bin/env python" . | xargs sed -i 's|/usr/bin/env python|/usr/bin/env python2|'
  sed -e "s|${pkgdir}/usr/data|/usr/share/astrometry/data|" -i ${pkgdir}/etc/astrometry.cfg
  rm ${pkgdir}/usr/share/doc/astrometry/report.txt
  rm ${pkgdir}/usr/bin/fitscopy
  rm ${pkgdir}/usr/bin/imcopy
}
md5sums=('b3fe53ab73139c7647fe07213a42f8ae')
