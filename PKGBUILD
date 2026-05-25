# deps.json
_spirv_reflect_commit=e55086b044225f9b511ae44dbf9b079d3625943f
_rstd_commit=036d65a66790f0635fa22cd31f3a24610b717502
_wavsen_commit=609676c524e3c2364dfb46c0f0f8c601f346102a
# aur/quickjs-ng is a static version...
_quickjs_commit=3c051980ab7e783dfbfb1c70c014ce5e05ecf24c

pkgname=open-wallpaper-engine
pkgver=0.1.2
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 libpipewire ffmpeg vulkan-icd-loader
         "waywallen>=0.1.5" cef glslang fontconfig)
makedepends=(cmake ninja git "clang>=21" lld argparse eigen glad glfw vulkan-headers nlohmann-json
             waywallen-display)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git#commit=$_spirv_reflect_commit"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/quickjs-ng/quickjs.git#commit=$_quickjs_commit"
        "0001-use-system-deps.diff")
sha256sums=('802f00c291bd6e3a59d5edb8933a83a381d0e5a42dc4a3d4faa6acd39e6f121b'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            '4084a64ce856093b1648792ed9f0c00fea9c61d59997577b2f21128a7fe0a1ec'
            'f39e96c654b7459ab7c8f81df3c2b983636a08a6807fd1bd5b00bcb110bfb7d7'
            '9ca66e359212494be96f10736090e45eca6593f2977b83a075358456d2c51b7a'
            '6061fd9e0f9080928605ad97a22807d4cd8e63b11be15f6d7f313af8578a7cae')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i ../0001-use-system-deps.diff
}
build() {
    # https://github.com/llvm/llvm-project/issues/121709
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"

    # /usr/src/cef/libcef_dll/ctocpp/ctocpp_ref_counted.h:136:26:
    # error: instantiation of variable 'CefCToCppRefCounted<CefBrowserCToCpp, CefBrowser, _cef_browser_t>::kWrapperType' required here, but no definition is available [-Werror,-Wundefined-var-template]
    # /build/open-wallpaper-engine/src/open-wallpaper-engine/viewer/VulkanBlitter.hpp:94:30:
    # error: private field 'frame_index_' is not used [-Werror,-Wunused-private-field]
    CXXFLAGS+=" -Wno-error=undefined-var-template -Wno-error=unused-private-field"
    cmake -B build -S "$pkgname" -G Ninja \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_LINKER=lld \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_SPIRV_REFLECT="$srcdir/SPIRV-Reflect" \
        -DFETCHCONTENT_SOURCE_DIR_RSTD="$srcdir/rstd" \
        -DFETCHCONTENT_SOURCE_DIR_WAVSEN="$srcdir/wavsen" \
        -DFETCHCONTENT_SOURCE_DIR_QUICKJS="$srcdir/quickjs"
    cmake --build build
}
package() {
    DESTDIR="$pkgdir" cmake --install build
}
