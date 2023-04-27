# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=1.0.2
pkgrel=1
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=("i686" "x86_64")
url="https://gnudatalanguage.github.io/"
license=("GPL")
depends=("eccodes" "expat" "fftw" "gcc-libs" "glibc" "glpk" "graphicsmagick"
         "gsl" "hdf4" "hdf5" "libgeotiff" "libpng" "libtiff" "libtirpc" "libx11"
         "netcdf" "openmpi" "plplot" "proj" "python" "readline" "shapelib"
         "udunits" "wxgtk3" "wxwidgets-common" "zlib")
makedepends=("cmake" "eigen" "python-numpy")
checkdepends=("openssh")
optdepends=("cuda")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnudatalanguage/gdl/archive/v${pkgver}.tar.gz"
        "gdl.profile")
sha512sums=("19869b68343ae8532ec9e27c402f69986d8269cc1f4c6af55402bef74f6dbee88c82b4c67db093b3be63377afb9a9a870f7baf484c8278d54ee5a7b5a428206a"
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
        -DLIBPROJ=ON -DMAGICK=OFF -DMPI=ON -DNETCDF=ON -DPYTHON=ON \
        -DPYTHONVERSION=3 -DPYTHON_MODULE=OFF -DQHULL=OFF -DREADLINE=ON \
        -DSHAPELIB=ON -DUDUNITS2=ON ..

    make
}

check() {
    cd "${srcdir}/gdl-${pkgver}/build"
    
    # we need *..driver_info files, those are installed but not in 
    while IFS= read -r -d '' file
    do
        base=$(basename "${file}" .so)
        cp ../src/plplotdriver/"${base}".driver_info src/plplotdriver/"${base}".driver_info
    done < <(find src/plplotdriver -name \*.so -print0)
    PLPLOT_DRV_DIR="src/plplotdriver/" ctest --output-on-failure
}

package() {
    cd "${srcdir}/gdl-${pkgver}/build"
    make DESTDIR="${pkgdir}" install

    install -D -m755 ../../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../{AUTHORS,HACKING,NEWS,README}
    install -D -m644 -t "${pkgdir}/usr/share/applications" ../doc/gdl.desktop
}
