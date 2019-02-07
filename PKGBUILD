# Maintainer: Ralf Mueller <stark.dreamdetective@gmail.com>
# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkgname=cdo
pkgver=1.9.6
fileID=19299
pkgrel=0
pkgdesc="Command line tool manipulate and analyse Climate model Data. Supported data formats are GRIB, netCDF, SERVICE, EXTRA and IEG. There are more than 400 operators available."
url="https://code.zmaw.de/projects/cdo"
license=('GPLv2')
depends=('netcdf' 'hdf5' 'proj' 'libaec' 'eccodes' 'udunits' 'fftw' 'curl' 'jasper' 'magics++')
makedepends=('netcdf' 'hdf5' 'proj' 'libaec' 'eccodes' 'udunits' 'fftw' 'curl' 'jasper' 'magics++')
provides=()
conflicts=()
replaces=()
arch=(i686 x86_64)
backup=()
install=
source=(https://code.zmaw.de/attachments/download/${fileID}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b31474c94548d21393758caa33f35cf7f423d5dfc84562ad80a2bdcb725b5585')

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
    --with-eccodes=/usr \
    --with-magics=/usr \
    --with-libxml2=/usr \
    CFLAGS="-g -O3 -std=gnu99 -Wall -fopenmp -march=native -ftree-vectorize -mavx2" \
    CXXFLAGS="-g -O3 -std=c++11 -Wall -fopenmp -march=native  -ftree-vectorize -mavx2" \
    LIBS="-ljasper -lpng -lopenjpeg" \
    CPPFLAGS="-I/usr/include/magics -I/usr/include/libxml2"

  make -j12 || return
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -f $pkgdir/bin/cdotest
}
