# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=1.0.4
pkgrel=1
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=("i686" "x86_64")
url="https://gnudatalanguage.github.io/"
license=("GPL")
depends=("eccodes" "expat" "fftw" "gcc-libs" "glibc" "glpk" "graphicsmagick"
         "gsl" "hdf4" "hdf5" "libgeotiff" "libpng" "libtiff" "libtirpc" "libx11"
         "netcdf" "openmpi" "plplot" "proj" "python" "readline" "shapelib"
         "udunits" "wxwidgets-common" "wxwidgets-gtk3" "zlib")
makedepends=("cmake" "eigen" "python-numpy")
checkdepends=("openssh")
optdepends=("cuda")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnudatalanguage/gdl/releases/download/v${pkgver}/gdl-v${pkgver}.tar.gz"
        "gdl.profile")
sha512sums=("3206bdd88b0478493221c0552e62620f1c9acbfec6f1900d73d932caae12401bf825e8893c81f844965f79e332bedb6ea99e6ea6f2b21427022efa60d1326eb0"
            "b3a3589d2ce8eb5d49c902aa9bc43df0a0fcc369d17deb060026d34fa821881a212ce6aa02edc7ea6c0476b2faacc7455e467af7b5baf672e2653b71b162190f")

build() {
    cd "${srcdir}/gdl-v1.0.4"
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DEIGEN3=ON -DFFTW=ON -DGLPK=ON \
        -DGRAPHICSMAGICK=ON -DGRIB=ON -DHDF5=ON -DHDF=ON -DHDFDIR=/opt/hdf4 \
        -DLIBPROJ=ON -DMAGICK=OFF -DMPI=ON -DNETCDF=ON -DPYTHON=ON \
        -DPYTHONVERSION=3 -DPYTHON_MODULE=OFF -DQHULL=ON -DREADLINE=ON \
        -DSHAPELIB=ON -DUDUNITS2=ON ..

    make
}

check() {
    cd "${srcdir}/gdl-v1.0.4/build"
    
    # we need *..driver_info files, those are installed but not in 
    while IFS= read -r -d '' file
    do
        base=$(basename "${file}" .so)
        cp ../src/plplotdriver/"${base}".driver_info src/plplotdriver/"${base}".driver_info
    done < <(find src/plplotdriver -name \*.so -print0)
    PLPLOT_DRV_DIR="src/plplotdriver/" ctest --output-on-failure
}

package() {
    cd "${srcdir}/gdl-v1.0.4/build"
    make DESTDIR="${pkgdir}" install

    install -D -m755 ../../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../{AUTHORS,HACKING,NEWS,README}
    install -D -m644 -t "${pkgdir}/usr/share/applications" ../doc/gdl.desktop
}
