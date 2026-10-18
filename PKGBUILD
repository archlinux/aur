pkgname=nekomote
pkgver=0.5.1
pkgrel=1
pkgdesc="A native 2D model runtime and live wallpaper for Linux."
arch=(x86_64)
url=https://www.nekopara.uk/archives/NekoMote.html
license=(AGPL-3.0-only)
depends=(glibc libgcc libstdc++ libglvnd wayland vulkan-icd-loader fontconfig libpng zlib libpulse glfw)
makedepends=(git cmake extra-cmake-modules nlohmann-json vulkan-headers glslang python-jinja
             libplasma)
checkdepends=(catch2 python-pillow nodejs)
optdepends=('libplasma: Use the KDE Wallpaper'
            'python: Extract assets from Nekopara Game')
source=("git+https://github.com/Chocola-X/NekoMote.git#tag=v${pkgver}"
        "git+https://github.com/fastfloat/fast_float.git#tag=v6.1.6"
        "git+https://github.com/nothings/stb.git#commit=2c980bb59875b0d32144a71867fbdebb2f77cd20"
        "git+https://github.com/Dav1dde/glad.git#tag=v2.0.8"
        "0001-use-system-dependencies.diff"
        "0002-install-qmlplugin-to-correct-directory.diff"
        "0003-fix-test-flags.diff")
sha256sums=('8f41d5112801377b5a73020efa8d9bbd46b8ec6996c909683b89d195bb743f3a'
            '62fbf6f5f41e55c5616614aeb6a990edec027f50fe61282139c99ddc0ad1be3a'
            '737ba3dd81be766ee09674b7e5ee086d9fcd1295e08477e8d3fd99e0580ea2e9'
            '211c9889f5be717d3087e5023bf163ca13985575939ce99b9f627f4d7d5c71cb'
            '93e55b04dae17f86e8ba2e6ebb9c056882acc2ab64ea4465e0f0b4264ba9506f'
            '65a86abc97a5089d7ed7b64fe0e6216b479b0e48d13b85662593b20f351a6bef'
            'ea311d5381df1d1076ee728d25309322738b83fb72531c2072a76b78acc862ad')


prepare() {
    cd NekoMote
    patch -Np1 -i ../0001-use-system-dependencies.diff
    patch -Np1 -i ../0002-install-qmlplugin-to-correct-directory.diff
    patch -Np1 -i ../0003-fix-test-flags.diff
}

build() {
    # /build/nekomote/src/NekoMote/adapters/plasma/probe/package_main.cpp:37:9:
    # error: conflicting return type specified for ‘virtual int {anonymous}::ProbeCorona::numScreens() const’
    cmake -B build -S NekoMote \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_FAST_FLOAT="${srcdir}/fast_float" \
        -DFETCHCONTENT_SOURCE_DIR_STB="${srcdir}/stb" \
        -DFETCHCONTENT_SOURCE_DIR_GLAD="${srcdir}/glad" \
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
