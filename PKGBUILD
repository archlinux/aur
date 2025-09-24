# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=1.1.1
pkgrel=3
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=("i686" "x86_64")
url="https://gnudatalanguage.github.io/"
license=("GPL-2.0-or-later")
depends=("eccodes" "expat" "fftw" "gcc-libs" "glibc" "glpk" "graphicsmagick" "gsl" "hdf4" "hdf5"
         "libgeotiff" "libpng" "libtiff" "libtirpc" "libx11" "openmpi" "proj" "python"
         "readline" "shapelib" "udunits" "wxwidgets-common" "wxwidgets-gtk3" "zlib")
makedepends=("cmake" "python-numpy" "qhull")
checkdepends=("openssh")
optdepends=("cuda")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnudatalanguage/gdl/releases/download/v${pkgver}/gdl-v${pkgver}.tar.gz"
        "gdl.profile")
sha512sums=("1bdbc0793d7bd025e120e8e44a091ad853ff524dab2bcb897146d4e59b58e81ad5c0c73ce08294ec9b41aec059b7ee0ba4d29f7d557f5635b2098027bf73bd1a"
            "b3a3589d2ce8eb5d49c902aa9bc43df0a0fcc369d17deb060026d34fa821881a212ce6aa02edc7ea6c0476b2faacc7455e467af7b5baf672e2653b71b162190f")

build() {
    cd "${srcdir}/gdl-v${pkgver}"
    if [[ -d build ]]; then
        rm -r build
    fi
    mkdir build
    cd build

    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DEIGEN3=OFF -DFFTW=ON -DGLPK=ON -DGRAPHICSMAGICK=ON \
        -DGRIB=ON -DHDF5=ON -DHDF=ON -DHDFDIR=/opt/hdf4 -DLIBPROJ=ON -DMAGICK=OFF -DMPI=ON \
        -DNETCDF=OFF -DPYTHON=ON -DPYTHONVERSION=3 -DPYTHON_MODULE=OFF -DQHULL=ON -DREADLINE=ON \
        -DSHAPELIB=ON -DUDUNITS2=ON -DX11=ON -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..

    make
}

check() {
    cd "${srcdir}/gdl-v${pkgver}/build"
    ctest --output-on-failure
}

package() {
    cd "${srcdir}/gdl-v${pkgver}/build"
    make DESTDIR="${pkgdir}" install

    install -D -m755 ../../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" ../{AUTHORS,HACKING,NEWS,README}
    install -D -m644 -t "${pkgdir}/usr/share/applications" ../doc/gdl.desktop
}
