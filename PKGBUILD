# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=astrometry.net
pkgver=0.73
pkgrel=1
pkgdesc="Automatic recognition of astronomical images"
arch=('i686' 'x86_64')
url="http://astrometry.net/"
license=("GPL")
depends=('bzip2' 'cairo' 'libpng' 'libjpeg-turbo' 'python' 'python-astropy'
'python-numpy' 'netpbm' 'cfitsio' 'gsl')
makedepends=('make' 'gcc' 'swig')
backup=(etc/astrometry.cfg)
install=astrometry.net.install
source=("https://github.com/dstndstn/${pkgname}/archive/${pkgver}.tar.gz")

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
       PY_BASE_INSTALL_DIR="${pkgdir}/usr/lib/python3.6/site-packages/astrometry" \
       PY_BASE_LINK_DIR="../lib/python3.6/site-packages/astrometry" \
       install

  sed -e "s|${pkgdir}/usr/data|/usr/share/astrometry/data|" -i ${pkgdir}/etc/astrometry.cfg
  rm ${pkgdir}/usr/share/doc/astrometry/report.txt
  rm ${pkgdir}/usr/bin/fitscopy
  rm ${pkgdir}/usr/bin/imcopy
}
md5sums=('c816b697ef6afe31a2c5fb150f2aa625')
