# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=0.9.9
pkgrel=4
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=('i686' 'x86_64')
url="https://github.com/gnudatalanguage/gdl"
license=('GPL')
depends=('python'
         'python-numpy'
         'plplot'
         'gsl'
         'readline'
         'hdf4'
         'hdf5'
         'netcdf'
         'netcdf-cxx'
         'wxgtk2'
         'fftw'
         'pslib'
         'eccodes'
         'udunits'
         'eigen'
         'libtirpc'
         'libmagick6'
         'libgeotiff')
makedepends=('cmake')
#options=('!makeflags')
source=("https://github.com/gnudatalanguage/gdl/archive/v${pkgver}.tar.gz"
        'gdl.profile'
        'gdl-python3.patch')
sha512sums=('41709c4951bbf71f7494eb339b6760756301b89b591020cb5a30c47d3b6f6228671a7d75b817e77f3ff6f1380505d27949e2900eb2577167de995f4941f288ee'
            'b3a3589d2ce8eb5d49c902aa9bc43df0a0fcc369d17deb060026d34fa821881a212ce6aa02edc7ea6c0476b2faacc7455e467af7b5baf672e2653b71b162190f'
            '0155857c3fe00cefc8f078a57105aae4b26a5aa93b6b44327f78861041c51a14e6581499021ad64bff24ac514a535a1340a690f135aa5ab38e19e98e5f32eb5e')

prepare() {
    cp gdl-python3.patch ${srcdir}/gdl-${pkgver}/gdl-python3.patch
    cd ${srcdir}/gdl-${pkgver}
    patch -p1 -l -i gdl-python3.patch
}

build() {
    cd ${srcdir}/gdl-${pkgver}
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON=YES -DPYTHONVERSION=3 \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 -DGRAPHICSMAGICK=OFF -DMAGICK=ON \
        -DFFTW=ON -DHDF=ON -DHDFDIR=/opt/hdf4 -DHDF5=ON -DGRIB=ON -DUDUNITS=ON ..

    make
}

package() {
    cd ${srcdir}/gdl-${pkgver}/build
    make DESTDIR=${pkgdir} install

    install -D -m755 ../../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../{AUTHORS,ChangeLog,HACKING,NEWS,README}
}
