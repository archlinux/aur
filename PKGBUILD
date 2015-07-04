# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=metview
pkgver=4.4.10
pkgrel=1
pkgdesc="ECMWF interactive meteorological application"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/METV/Metview"
license=('APACHE')
groups=(science)
depends=( 'magics++>=2.22' mksh openmotif netcdf-cxx-legacy grib_api qtwebkit libxpm)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://software.ecmwf.int/wiki/download/attachments/3964985/Metview-${pkgver}.tar.gz imagemagick_xpm_fix.patch)
noextract=()
md5sums=('13327f8ed5a344b42948f83fb2c44eb9'
         '4ab00461ee0fe6d76081eaa89ffe9963')

build() {
  cd Metview-${pkgver}
  chmod 644 share/metview/icons/fix_last_line
  patch -p0 -i $srcdir/imagemagick_xpm_fix.patch
  chmod 755 share/metview/icons/fix_last_line
  autoreconf -f -i
  QMAKE=/usr/bin/qmake-qt4 MOC=/usr/bin/moc-qt4 \
  UIC=/usr/bin/uic-qt4 RCC=/usr/bin/rcc-qt4 \
  FC=gfortran F77=gfortran F9X=gfortran PYTHON=python2 \
  ./configure --with-python-command=/usr/bin/python2 --with-proj4=/usr \
  --with-grib-api=/usr --with-emos-libraries=/usr --with-netcdf=/usr \
  --with-magics-home=/usr --prefix=/usr
  sed -i src/Desktop/Makefile -e 's/-ljasper/-ljasper -lQtXmlPatterns/'
  make || return 1
}

package()
{
  cd Metview-${pkgver}
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
