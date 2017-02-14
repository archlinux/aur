# Maintainer: Ralf Mueller <stark.dreamdetective@gmail.com>
# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkgname=cdo
pkgver=1.8.0
fileID=13772
pkgrel=0
pkgdesc="Command line tool manipulate and analyse Climate model Data. Supported data formats are GRIB, netCDF, SERVICE, EXTRA and IEG. There are more than 400 operators available."
url="https://code.zmaw.de/projects/cdo"
license=('GPLv2')
depends=('netcdf' 'hdf5' 'proj' 'szip' 'grib_api' 'udunits' 'fftw' 'curl' 'jasper' 'magics++')
makedepends=('netcdf' 'hdf5' 'proj' 'szip' 'grib_api' 'udunits' 'fftw' 'curl' 'jasper' 'magics++')
provides=()
conflicts=()
replaces=()
arch=(i686 x86_64)
backup=()
install=
source=(https://code.zmaw.de/attachments/download/${fileID}/${pkgname}-${pkgver}.tar.gz)
md5sums=('42d4990a7c03159bc74335035273a59d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --with-netcdf=/usr \
    --with-udunits2=/usr \
    --with-hdf5=/usr \
    --with-szlib=/usr \
    --with-proj=/usr \
    --with-fftw3 \
    --with-curl=/usr \
    --with-grib_api=/usr \
    --with-magics=/usr \
    --with-libxml2=/usr \
    CFLAGS="-g -O3 -std=gnu99 -Wall -fopenmp -march=native " \
    LIBS="-lhdf5 -ljasper -lpng -lopenjpeg" \
    CPPFLAGS="-I/usr/include/magics -I/usr/include/libxml2"
  make -j12 || return 


# ./configure --prefix=/usr --with-netcdf=/usr --with-udunits2=/usr
# --with-hdf5=/usr --with-szlib=/usr --with-grib_api=/usr --with-magics=/usr
# CFLAGS="-g -O3 -Wall -fopenmp -march=native $(pkg-config magics --cflags)
# -std=gnu99" --with-libxml2 LIBS='-lpng -lopenjpeg -lstdc++'
#
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -f $pkgdir/bin/cdotest
}
