# Maintainer: Salamandar <felix@piedallu.me>

pkgname=prusa-slicer-git
pkgver=2.6.0.alpha0.r156.gc3bdf2fc2
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
    # wx 3.2 is not supported yet https://github.com/prusa3d/PrusaSlicer/issues/8299
    # 'wxgtk3'
)

# prusa-slicer use a patched wxWidgets and does not work with upstream, commit pinned in
# https://github.com/prusa3d/PrusaSlicer/blob/version_${pkgver}/deps/wxWidgets/wxWidgets.cmake
_wxcommit=489f6118256853cf5b299d595868641938566cdb

source=(
    "git+${url}"
    'prusa-slicer-boost-placeholders.patch'
    "https://github.com/prusa3d/wxWidgets/archive/${_wxcommit}/wxWidgets-${_wxcommit}.tar.gz"
)
sha256sums=(
    'SKIP'
    '58cae07a418a797222f4cb10950fa2fd7afb7570519785b082cc7d7e7f407c02'
    'SKIP'
)
conflicts=('prusa-slicer')

pkgver() {
    git -C "${srcdir}/PrusaSlicer" describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^version_//'
}

prepare() {
    cd "PrusaSlicer"
    # Fix build with Boost 1.76.0
    patch -p1 < "$srcdir/prusa-slicer-boost-placeholders.patch"
}


_build_wx_static() {
    cmake -B deps -S wxWidgets-${_wxcommit} -G Ninja\
        -DCMAKE_INSTALL_PREFIX="$deps_install_dir" \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DBUILD_SHARED_LIBS=OFF \
        -DwxBUILD_TOOLKIT=gtk3 \
        -DwxUSE_MEDIACTRL=OFF \
        -DwxUSE_DETECT_SM=OFF \
        -DwxUSE_UNICODE=ON \
        -DwxUSE_UNICODE_UTF8=ON \
        -DwxUSE_OPENGL=ON \
        -DwxUSE_LIBPNG=sys \
        -DwxUSE_ZLIB=sys \
        -DwxUSE_REGEX=builtin \
        -DwxUSE_LIBJPEG=sys \
        -DwxUSE_LIBTIFF=sys \
        -DwxUSE_EXPAT=sys \
        -DwxUSE_LIBLZMA=sys \
        -DwxUSE_LIBSDL=OFF \
        -DwxUSE_XTEST=OFF
    cmake --build deps
    cmake --install deps
}

build() {
    export CC=clang
    export CXX=clang++

    deps_install_dir="$srcdir/deps/destdir/usr/local"
    _build_wx_static

    cmake_args=(
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib
        -DSLIC3R_FHS=ON
        -DSLIC3R_PCH=OFF
        -DSLIC3R_GTK=3
        -DOPENVDB_FIND_MODULE_PATH=/usr/lib/cmake/OpenVDB
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
