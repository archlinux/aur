pkgname=nekomote
pkgver=0.5.2
pkgrel=1
pkgdesc="A native 2D model runtime and live wallpaper for Linux."
arch=(x86_64)
url=https://www.nekopara.uk/archives/NekoMote.html
license=(AGPL-3.0-only)
depends=(glibc libgcc libstdc++ libglvnd wayland vulkan-icd-loader fontconfig libpng zlib libpulse glfw)
makedepends=(git cmake extra-cmake-modules nlohmann-json vulkan-headers glslang python-jinja
             libplasma fast_float stb glad)
checkdepends=(catch2 python-pillow nodejs)
optdepends=('libplasma: Use the KDE Wallpaper'
            'python: Extract assets from Nekopara Game'
            "nekomote-assets=${pkgver}: Managed assets")
source=("git+https://github.com/Chocola-X/NekoMote.git#tag=v${pkgver}"
        "0003-fix-test-flags.diff")
sha256sums=('3d7120e6b82c4062b5a33c0385416b0e7b34042322b53596ed35cc0c13e85699'
            'ea311d5381df1d1076ee728d25309322738b83fb72531c2072a76b78acc862ad')


prepare() {
    cd NekoMote
    patch -Np1 -i ../0003-fix-test-flags.diff
}

build() {
    # /build/nekomote/src/NekoMote/adapters/plasma/probe/package_main.cpp:37:9:
    # error: conflicting return type specified for ‘virtual int {anonymous}::ProbeCorona::numScreens() const’
    cmake -B build -S NekoMote \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNEKOMOTE_USE_SYSTEM_DEPS=ON \
        -DNEKOMOTE_INSTALL_QMLDIR=lib/qt6/qml \
        -DNEKOMOTE_BUILD_QT_QUICK=ON \
        -DNEKOMOTE_BUILD_PLASMA=ON \
        -DNEKOMOTE_BUILD_PLASMA_PROBE=OFF \
        -DNEKOMOTE_BUILD_LAYER_SHELL=ON \
        -DNEKOMOTE_BUILD_VULKAN=ON \
        -DNEKOMOTE_WERROR=OFF \
        -DFASTFLOAT_INSTALL=OFF
    cmake --build build
}

check() {
    export QML_IMPORT_PATH="$srcdir/build/adapters/plasma"
    ctest --test-dir build --output-on-failure --parallel $(nproc) \
        --label-exclude gpu
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm755 NekoMote/tools/import_session/import_session.py \
        "$pkgdir/usr/bin/nekomote_import_session"
    sed -i "s|#!/usr/bin/env python|#!/usr/bin/python|" \
        "$pkgdir/usr/bin/nekomote_import_session"
}
