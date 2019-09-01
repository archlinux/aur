# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=0.9.9
pkgrel=1
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=('i686' 'x86_64')
url="https://github.com/gnudatalanguage/gdl"
license=('GPL')
depends=('python2'
         'python2-numpy'
         'plplot'
         'gsl'
         'readline'
         'hdf4'
         'hdf5'
         'netcdf'
         'netcdf-cxx'
         'wxgtk'
         'fftw'
         'pslib'
         'eccodes'
         'udunits'
         'eigen3'
         'libtirpc'
         'libmagick6'
         'libgeotiff')
makedepends=('cmake')
#options=('!makeflags')
source=("https://github.com/gnudatalanguage/gdl/archive/v${pkgver}.tar.gz"
        'gdl.profile')
sha256sums=('ad5de3fec095a5c58b46338dcc7367d2565c093794ab1bbcf180bba1a712cf14'
            '8df4d0676ffcece07a6884c2836523cdda0bd7668b9491a96ef816bb993e6a2b')

prepare() {
    cd ${srcdir}/gdl-${pkgver}
}

build() {
    cd ${srcdir}/gdl-${pkgver}
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON=YES -DPYTHONVERSION=2 \
        -DPYTHON_EXECUTABLE=/usr/bin/python2.7 -DGRAPHICSMAGICK=OFF -DMAGICK=ON \
        -DFFTW=ON -DHDF=ON -DHDFDIR=/opt/hdf4 -DHDF5=ON -DGRIB=ON -DUDUNITS=ON ..

    make
}

package() {
    cd ${srcdir}/gdl-${pkgver}/build
    make DESTDIR=${pkgdir} install

    install -D -m755 ../../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../{AUTHORS,ChangeLog,HACKING,NEWS,README}
}
