# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=1.0.1
pkgrel=5
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=("i686" "x86_64")
url="https://gnudatalanguage.github.io/"
license=("GPL")
depends=("eccodes" "eigen" "fftw" "glpk" "graphicsmagick" "gsl" "hdf4"
         "libgeotiff" "plplot" "python-numpy" "shapelib" "udunits" "wxgtk3")
makedepends=("cmake")
checkdepends=("openssh")
optdepends=("cuda")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnudatalanguage/gdl/archive/v${pkgver}.tar.gz"
        "gdl.profile"
        "gdl_pr_1337.patch")
sha512sums=("9d15f114d26d03c34dce6177a5d5115e81c128ec21752c01d171f8427e6cb21b9d0b69a44e29891b5e8fc2bd4d0b89d1a8dcd189f362a13c6e59182528b5842d"
            "b3a3589d2ce8eb5d49c902aa9bc43df0a0fcc369d17deb060026d34fa821881a212ce6aa02edc7ea6c0476b2faacc7455e467af7b5baf672e2653b71b162190f"
            "2d000c4c619bf59ad21244b758250e4c458ca0d4309ea0a89bd3e79ced0335e15984262ac8577baabcaaf1e4e50dc3ea7450f3f15bc71576e497fa189a4d484a")

prepare() {
    cd "${srcdir}/gdl-${pkgver}"
    patch -p1 -i "${srcdir}/gdl_pr_1337.patch"
}

build() {
    cd "${srcdir}/gdl-${pkgver}"
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DEIGEN3=ON -DFFTW=ON -DGLPK=ON \
        -DGRAPHICSMAGICK=ON -DGRIB=ON -DHDF5=ON -DHDF=ON -DHDFDIR=/opt/hdf4 \
        -DLIBPROJ=ON -DMAGICK=OFF -DMPI=ON -DNETCDF=ON -DPYTHON_MODULE=OFF \
        -DREADLINE=ON -DSHAPELIB=ON -DUDUNITS2=ON -DPYTHON=ON -DPYTHONVERSION=3 ..

    make
}

check() {
    cd "${srcdir}/gdl-${pkgver}/build"
    ctest --output-on-failure
}

package() {
    cd "${srcdir}/gdl-${pkgver}/build"
    make DESTDIR="${pkgdir}" install

    install -D -m755 ../../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../{AUTHORS,HACKING,NEWS,README}
    install -D -m644 -t "${pkgdir}/usr/share/applications" ../doc/gdl.desktop
}
