# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=0.9.8
pkgrel=5
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=('i686' 'x86_64')
url="http://gnudatalanguage.sourceforge.net/"
license=('GPL')
depends=('python2'
         'python2-numpy'
         'plplot510'
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
         'graphicsmagick')
makedepends=('cmake')
options=('!makeflags')
source=("http://downloads.sourceforge.net/gnudatalanguage/gdl-${pkgver}.tgz"
        'gdl-tirpc.patch'
        'gdl-updates.patch'
#       'gdl-python3.patch'
        'gdl.profile')
sha256sums=('86d3aacd1de3994755dc917c732ee3360e4e7e4f16156f1eea47de048d138281'
            '905d6b2d464e136a2c7d5fccbede8839ad7c277c417e9dd6cd8d82795fd7e686'
            '56774a6bb7ee6e84412f17b5479a31036ac73991d438864aef9f1543d9ed420e'
#           'eacacc47fae91e418115bb0845ab585d819151d63bd7f99b43374e72a9cefd0c'
            '8df4d0676ffcece07a6884c2836523cdda0bd7668b9491a96ef816bb993e6a2b')

prepare() {
    cd ${srcdir}/gdl-${pkgver}

    patch -p1 < ../gdl-tirpc.patch
    patch -p1 < ../gdl-updates.patch
#   patch -Np1 -i "${srcdir}/gdl-python3.patch"
}

build() {
    cd ${srcdir}/gdl-${pkgver}
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON=YES -DPYTHONVERSION=2.7 \
        -DPYTHON_EXECUTABLE=/usr/bin/python2.7 -DGRAPHICSMAGICK=ON -DMAGICK=OFF \
        -DFFTW=ON -DHDF=ON -DHDFDIR=/opt/hdf4 -DHDF5=ON -DGRIB=ON -DUDUNITS=ON ..

    make
}

package() {
    cd ${srcdir}/gdl-${pkgver}/build
    make DESTDIR=${pkgdir} install

    install -D -m755 ../../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../{AUTHORS,ChangeLog,HACKING,NEWS,README}
}
