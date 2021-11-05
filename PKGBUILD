# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=prusa-slicer

pkgname=${_pkgname}-git
pkgver=2.4.0.alpha0.r725.g47f265f77
pkgrel=1
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
    'prusa-slicer.desktop'
    'https://raw.githubusercontent.com/archlinux/svntogit-community/1dea61c0b581ff5001d073689f68b0323740be93/trunk/prusa-slicer-openexr3.patch'
)
sha256sums=(
    'SKIP'
    '26b66701cb2512f0d524add44689e2478c0b875f73103034e74544a9574782c5'
    '1ef7c22f641b7c18de212202c21f14f6533834a36d7fe0c2b322bc9a13804c6b'
)
conflicts=('prusa-slicer')

pkgver() {
    cd "${srcdir}/PrusaSlicer"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

prepare() {
    cd "PrusaSlicer"
    patch -p1 < "$srcdir/prusa-slicer-openexr3.patch" # Fix build with openEXR 3
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

    # Desktop file
    install -Dm644 "${srcdir}/prusa-slicer.desktop" -t "${pkgdir}/usr/share/applications"

    # Desktop icons
    for i in '32' '128' '192' ; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/"
        ln -s "/usr/share/PrusaSlicer/icons/PrusaSlicer_${i}px.png" \
                 "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
    done
}
