# Maintainer: Salamandar <felix@piedallu.me>

pkgname=prusa-slicer-git
pkgver=2.6.0.alpha5
pkgrel=1
pkgdesc='G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)'
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url='https://github.com/prusa3d/PrusaSlicer'
license=('AGPL3')
makedepends=(
    'cmake'
    'ninja'
    'clang'
    # 'boost'
    # 'cereal'
    'eigen'
    'gtest'
)
depends=(
    # 'boost-libs'
    # 'cgal'
    # 'curl'
    'dbus'
    # 'glew'
    'intel-tbb'
    # 'libpng'
    # 'nanosvg_fltk'
    # 'nlopt'
    # 'openvdb'
    # 'qhull'
    # wx 3.2 is not supported yet https://github.com/prusa3d/PrusaSlicer/issues/8299
    # 'wxgtk3'
)

source=(
    "git+${url}"
    '0001-Fix-format-string.patch'
)
sha256sums=(
    'SKIP'
    'b78fa23a5bccf0a1064f20786bfaede97f0691b6ebb882a698bedc0b3421ec72'
)
conflicts=('prusa-slicer')

pkgver() {
    git -C "${srcdir}/PrusaSlicer" describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

prepare() {
    cd "PrusaSlicer"
    # Fix build
    patch -p1 < "$srcdir/0001-Fix-format-string.patch"

    rm "$srcdir/PrusaSlicer/cmake/modules/FindEXPAT.cmake"
}

_build_deps() {
    cmake -B deps/build -S PrusaSlicer/deps -G Ninja \
        -DDEP_WX_GTK3=ON \
        -DDEP_DEBUG=OFF \
        -DDEP_DOWNLOAD_DIR=deps/downloads \
        -DDESTDIR="$deps_destdir"

    cmake --build deps/build -j1
    cmake --install deps/build
}

build() {
    export CC=clang
    export CXX=clang++

    deps_destdir="$srcdir/deps/destdir"
    deps_install_dir="$deps_destdir/usr/local"
    _build_deps

    cmake_args=(
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib
        -DSLIC3R_FHS=ON
        -DSLIC3R_PCH=OFF
        -DSLIC3R_GTK=3
        # -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB
        -DOPENVDB_USE_STATIC_LIBS=ON
        -DSLIC3R_STATIC=1
    )
    # for statically linked wx-gtk3
    cmake_args+=(
        -DwxWidgets_USE_STATIC=ON
        -DCMAKE_PREFIX_PATH="$deps_install_dir"
    )
    # For system-provided wx-gtk3
    # cmake_args+=(
    #     -DSLIC3R_STATIC=OFF
    #     -DSLIC3R_WX_STABLE=ON
    #     -DwxWidgets_CONFIG_EXECUTABLE=$(which wx-config-gtk3)
    # )

    cmake -B build -S PrusaSlicer -G Ninja "${cmake_args[@]}"
    cmake --build build
}

check() {
    cd build
    ctest -V
}

package () {
    DESTDIR="$pkgdir" cmake --install build

    # Patch desktop files
    for i in PrusaGcodeviewer PrusaSlicer; do
        sed -i '/^Name=/ s/$/ (Git version)/' "${pkgdir}/usr/share/applications/$i.desktop"
    done
}
