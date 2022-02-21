# Maintainer: Salamandar <felix@piedallu.me>

pkgname=prusa-slicer-git
pkgver=2.5.0.alpha0.r43.g3a821d675
pkgrel=1
pkgdesc='G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)'
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url='https://github.com/prusa3d/PrusaSlicer'
license=('AGPL3')
makedepends=(
    'cmake'
    'ninja'
    'clang'
    'boost'
    'cereal'
    'eigen'
    'gtest'
)
depends=(
    'boost-libs'
    'cgal'
    'curl'
    'dbus'
    'glew'
    'intel-tbb'
    'libpng'
    'nlopt'
    'openvdb'
    'qhull'
    'wxgtk3'
)

source=(
    "git+${url}"
    'prusa-slicer-boost-placeholders.patch'
    '0001-Use-namespaces-to-link-against-libcereal-1.3.1.patch'
)
sha256sums=(
    'SKIP'
    '58cae07a418a797222f4cb10950fa2fd7afb7570519785b082cc7d7e7f407c02'
    '74d38c96ff7534aff64f3817579e86e9c63de08d1641118681a53dd4bbb2a6d6'
)
conflicts=('prusa-slicer')

pkgver() {
    git -C "${srcdir}/PrusaSlicer" describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

prepare() {
    cd "PrusaSlicer"
    # Fix build with Boost 1.76.0
    patch -p1 < "$srcdir/prusa-slicer-boost-placeholders.patch"
    patch -p1 < "$srcdir/0001-Use-namespaces-to-link-against-libcereal-1.3.1.patch"
}

build() {
    export CC=clang
    export CXX=clang++

    cmake -B build -S PrusaSlicer -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DSLIC3R_FHS=ON \
        -DSLIC3R_PCH=OFF \
        -DSLIC3R_WX_STABLE=ON \
        -DSLIC3R_GTK=3 \
        -DSLIC3R_STATIC=OFF \
        -DwxWidgets_CONFIG_EXECUTABLE=$(which wx-config-gtk3) \
        -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB

    ninja -C build
}

check() {
    cd "build"
    ctest -V
}

package () {
    DESTDIR="${pkgdir}" ninja -C "build" install

    # Patch desktop files
    for i in PrusaGcodeviewer PrusaSlicer; do
        sed -i '/^Name=/ s/$/ (Git version)/' "${pkgdir}/usr/share/applications/$i.desktop"
    done
}
