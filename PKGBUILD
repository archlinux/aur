# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=1.0.0_rc.3
pkgrel=1
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=("i686" "x86_64")
url="https://github.com/gnudatalanguage/gdl"
license=("GPL")
depends=("eccodes" "eigen" "fftw" "glpk" "graphicsmagick" "gsl" "hdf4"
         "libgeotiff" "plplot" "python-numpy" "shapelib" "udunits" "wxgtk2")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnudatalanguage/gdl/archive/v${pkgver//_/-}.tar.gz"
        "gdl.profile"
        "gdl-mallinfo2.patch"
        "gdl-tiff.patch")
sha512sums=("3fde22c7e709b9cdc72a23d2317c043037379c7903418211a699c7e5caa2ed17e78e32e6d2f9b4aa89200e729fc21555821140dfdd58a5a636a858e2841f6335"
            "b3a3589d2ce8eb5d49c902aa9bc43df0a0fcc369d17deb060026d34fa821881a212ce6aa02edc7ea6c0476b2faacc7455e467af7b5baf672e2653b71b162190f"
            "e57a1d75039ac7c0654fb03bd0c95b6efb7beb605ea0a303af964fe7408f5d9497abd408fabb38fdb1d8b8dff86c2beefec0bb16df399b39284ddb4e22672f68"
            "d55b2970c9ddfb0b78790e7fa876bf28ebef9e936d56c77105572b85095337cb65c7b564515b42afeafe5fa03d8faa562183ecb3c04fe592f6775cce5d4662bc")

prepare() {
    cd "${srcdir}/gdl-${pkgver//_/-}"
    patch -p1 -l -N -i "${srcdir}"/gdl-mallinfo2.patch
    patch -p1 -l -N -i "${srcdir}"/gdl-tiff.patch
}

build() {
    cd "${srcdir}/gdl-${pkgver//_/-}"
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON=ON -DPYTHONVERSION=3 \
        -DPYTHON_MODULE=OFF -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DGRAPHICSMAGICK=ON -DMAGICK=OFF -DFFTW=ON -DHDF=ON \
        -DHDFDIR=/opt/hdf4 -DHDF5=ON -DGRIB=ON -DUDUNITS2=ON -DEIGEN3=ON \
        -DNETCDF=ON -DREADLINE=ON -DLIBPROJ4=OFF -DGLPK=ON -DSHAPELIB=ON ..

    make
}

check() {
    cd "${srcdir}/gdl-${pkgver//_/-}/build"
    make check
}

package() {
    cd "${srcdir}/gdl-${pkgver//_/-}/build"
    make DESTDIR="${pkgdir}" install

    install -D -m755 ../../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../{AUTHORS,HACKING,NEWS,README}
    install -D -m644 -t "${pkgdir}/usr/share/applications" ../doc/gdl.desktop
}
