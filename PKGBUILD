# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=prusa-slicer

pkgname=${_pkgname}-git
pkgver=2.1.1
pkgrel=3
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
    'qhull'
)
makedepends=(
    'cmake'
    'ninja'
    'boost'
    'cereal'
    'eigen3'
    'gtest'
)
source=(
    "git+${url}"
    'prusa-slicer.desktop'
)
sha256sums=(
    'SKIP'
    '26b66701cb2512f0d524add44689e2478c0b875f73103034e74544a9574782c5'
)
conflicts=('prusa-slicer')

pkgver() {
    cd "${srcdir}/PrusaSlicer"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

build() {
    cd "${srcdir}/PrusaSlicer"
    mkdir -p build

    cd build
    cmake .. -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DSLIC3R_FHS=ON \
        -DSLIC3R_PCH=OFF \
        -DSLIC3R_WX_STABLE=ON \
        -DSLIC3R_GTK=3 \
        -DSLIC3R_STATIC=OFF \

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
