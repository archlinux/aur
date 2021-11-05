# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=prusa-slicer

pkgname=${_pkgname}-git
pkgver=2.4.0.beta1.r65.gaff9e1f7e
pkgrel=2
pkgdesc='G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)'
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url='https://github.com/prusa3d/PrusaSlicer'
license=('AGPL3')
depends=(
    'boost-libs'
    'cgal'
    'curl'
    'glew'
    'intel-tbb'
    'nlopt'
    'openvdb'
    'wxgtk3'
    'qhull>=2020.2-4'
)
makedepends=(
    'cmake'
    'ninja'
    'boost'
    'cereal'
    'eigen'
    'gtest'
)
source=(
    "git+${url}"
    'prusa-slicer-boost-placeholders.patch'
)
sha256sums=(
    'SKIP'
    '58cae07a418a797222f4cb10950fa2fd7afb7570519785b082cc7d7e7f407c02'
)
conflicts=('prusa-slicer')

pkgver() {
    cd "${srcdir}/PrusaSlicer"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

prepare() {
    cd "PrusaSlicer"
    # Fix build with Boost 1.76.0
    patch -p1 < "$srcdir/prusa-slicer-boost-placeholders.patch"
}

build() {
    cd "${srcdir}/PrusaSlicer"
    mkdir -p build

    cd build
    WX_CONFIG=wx-config-gtk3 \
    cmake .. -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DSLIC3R_FHS=ON \
        -DSLIC3R_PCH=ON \
        -DSLIC3R_WX_STABLE=ON \
        -DSLIC3R_GTK=3 \
        -DSLIC3R_STATIC=OFF \
        -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB

    ninja
}

check() {
    cd "${srcdir}/PrusaSlicer/build"
    ctest -V
}

package () {
    cd "${srcdir}/PrusaSlicer/build"
    DESTDIR="${pkgdir}" ninja install

    # Patch desktop files
    for i in PrusaGcodeviewer PrusaSlicer; do
        sed -i '/^Name=/ s/$/ (Git version)/' "${pkgdir}/usr/share/applications/$i.desktop"
    done
}
