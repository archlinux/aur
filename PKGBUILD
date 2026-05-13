# deps.json
_spirv_reflect_commit=e55086b044225f9b511ae44dbf9b079d3625943f
_rstd_commit=9fdc3ebeda7289bd1db7d2fb0b978e6ed0b1a63e
_wavsen_commit=b6fca590e5b874f4d87ba0ab2a54df580e242439
# aur/quickjs-ng is a static version...
_quickjs_commit=3c051980ab7e783dfbfb1c70c014ce5e05ecf24c

pkgname=open-wallpaper-engine
pkgver=0.1.1
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 cubeb ffmpeg vulkan-icd-loader directx-shader-compiler
         waywallen cef)
makedepends=(cmake ninja git clang lld argparse eigen glad glfw vulkan-headers nlohmann-json
             waywallen-display)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git#commit=$_spirv_reflect_commit"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/quickjs-ng/quickjs.git#commit=$_quickjs_commit"
        "0001-use-system-deps.diff")
sha256sums=('d14412f5a2a2369baff4272c55c781f4af0c66f005cb7f6b7ccc8f27b5f8cc5a'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            'de3e235c080bd9ddd26bbddab43d64d3ab329b9ce700b267a5a9d6fb143452e8'
            'e56b8a07f718b335a8e00c21dd76e3d0e6df7fdf2f367baa33fed8c61b185481'
            '9ca66e359212494be96f10736090e45eca6593f2977b83a075358456d2c51b7a'
            '095bddaed96a62d799011b58a6337f345c748f0c8ac31a3f5aa7b3e0c44d4b7b')

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
