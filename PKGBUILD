# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=1.0.1
pkgrel=3
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=("i686" "x86_64")
url="https://gnudatalanguage.github.io/"
license=("GPL")
depends=("eccodes" "eigen" "fftw" "glpk" "graphicsmagick" "gsl" "hdf4"
         "libgeotiff" "plplot" "python-numpy" "shapelib" "udunits" "wxgtk2")
makedepends=("cmake")
checkdepends=("openssh")
optdepends=("cuda")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnudatalanguage/gdl/archive/v${pkgver}.tar.gz"
        "gdl.profile")
sha512sums=("9d15f114d26d03c34dce6177a5d5115e81c128ec21752c01d171f8427e6cb21b9d0b69a44e29891b5e8fc2bd4d0b89d1a8dcd189f362a13c6e59182528b5842d"
            "b3a3589d2ce8eb5d49c902aa9bc43df0a0fcc369d17deb060026d34fa821881a212ce6aa02edc7ea6c0476b2faacc7455e467af7b5baf672e2653b71b162190f")

build() {
    cd "${srcdir}/gdl-${pkgver}"
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DEIGEN3=ON -DFFTW=ON -DGLPK=ON \
        -DGRAPHICSMAGICK=ON -DGRIB=ON -DHDF5=ON -DHDF=ON -DHDFDIR=/opt/hdf4 \
        -DLIBPROJ=ON -DMAGICK=OFF -DMAGICK=OFF -DMPI=ON -DNETCDF=ON \
        -DPYTHON_MODULE=OFF -DREADLINE=ON -DSHAPELIB=ON -DUDUNITS2=ON \
        -DPYTHON=ON -DPYTHONVERSION=3 ..

    make
}

check() {
    cd "${srcdir}/gdl-${pkgver}/build"
    make test
}

package() {
    cd "${srcdir}/gdl-${pkgver}/build"
    make DESTDIR="${pkgdir}" install

    install -D -m755 ../../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../{AUTHORS,HACKING,NEWS,README}
    install -D -m644 -t "${pkgdir}/usr/share/applications" ../doc/gdl.desktop
}
