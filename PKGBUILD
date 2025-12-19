# Maintainer: Jan Kohnert <bughunter at jan-kohnert.de>
# Contributor: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: James Tappin <jtappinatgmaildotcom>
# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=gnudatalanguage
pkgver=1.1.2
pkgrel=2
pkgdesc="An IDL (Interactive Data Language) compatible incremental compiler (ie. runs IDL programs)"
arch=("i686" "x86_64")
url="https://gnudatalanguage.github.io/"
license=("GPL-2.0-or-later")
depends=("eccodes" "expat" "fftw" "gcc-libs" "glibc" "glpk" "graphicsmagick" "gsl" "hdf4" "hdf5"
         "libgeotiff" "libpng" "libtiff" "libtirpc" "libx11" "openmpi" "proj" "python"
         "readline" "shapelib" "udunits" "wxwidgets-common" "wxwidgets-gtk3" "zlib")
makedepends=("cmake" "eigen" "python-numpy" "qhull")
checkdepends=("openssh")
optdepends=("cuda")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnudatalanguage/gdl/releases/download/v${pkgver}/gdl-v${pkgver}.tar.gz"
        "Fix-include.patch"
        "gdl.profile")
sha512sums=("1adfaf2bee42bc93c78d7aa80e9bc9262ffcc91ecc6a5731bba2d44f06f5b67eacd6e1ef498af4fa086ab6b714014471908342003ed5ea20d56f65a5c8295410"
            "d849da6d6be16d6f7e81bfd7dca7e05fbcb8040e689d1e564a69037804171ca7fa722685a62ad37b607966b7ce10697cd1dc064f4210ea77ff9334a341954391"
            "b3a3589d2ce8eb5d49c902aa9bc43df0a0fcc369d17deb060026d34fa821881a212ce6aa02edc7ea6c0476b2faacc7455e467af7b5baf672e2653b71b162190f")

prepare() {
    cd "${srcdir}/gdl-v${pkgver}"

    patch -p1 -i ../Fix-include.patch
}

build() {
    local cmake_options=(
        -B build
        -S gdl-v${pkgver}
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CMAKE_SKIP_INSTALL_RPATH=YES
        -D EIGEN3=ON
        -D FFTW=ON
        -D GLPK=ON
        -D GRAPHICSMAGICK=ON
        -D GRIB=ON
        -D HDF5=ON
        -D HDF=ON
        -D HDFDIR=/opt/hdf4
        -D LIBPROJ=ON
        -D MAGICK=OFF
        -D MPI=ON
        -D NETCDF=OFF
        -D PYTHON=ON
        -D PYTHONVERSION=3
        -D PYTHON_MODULE=OFF
        -D QHULL=ON
        -D READLINE=ON
        -D SHAPELIB=ON
        -D UDUNITS2=ON
        -D X11=ON
    )

    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    local excluded_tests="(test_gdl2gdl|test_plot_ranges)"
    local ctest_flags=(
        --test-dir build
        --output-on-failure
        --parallel $(nproc)
        --exclude-regex "$excluded_tests"
    )
    ctest "${ctest_flags[@]}"
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -D -m755 ../gdl.profile "${pkgdir}/etc/profile.d/gdl.sh"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" "gdl-v${pkgver}"/{AUTHORS,HACKING,NEWS,README}
    install -D -m644 -t "${pkgdir}/usr/share/applications" "gdl-v${pkgver}/doc/gdl.desktop"
}
