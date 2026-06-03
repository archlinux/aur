# deps.json
_spirv_reflect_tag=vulkan-sdk-1.4.321.0
_rstd_commit=629bda81eb98856ca023f0f87f57dde8d22b4823
_wavsen_commit=236348381b8670175e2f20ab8b29a02b61622037
# aur/quickjs-ng is a static version...
_quickjs_commit=3c051980ab7e783dfbfb1c70c014ce5e05ecf24c

pkgname=open-wallpaper-engine
pkgver=0.1.3
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 libpulse ffmpeg vulkan-icd-loader
         "waywallen>=0.1.5" cef glslang fontconfig)
makedepends=(cmake ninja git "clang>=21" lld argparse eigen3 glad glfw vulkan-headers nlohmann-json
             waywallen-display)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git#tag=$_spirv_reflect_tag"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/quickjs-ng/quickjs.git#commit=$_quickjs_commit"
        "0001-use-system-deps.diff")
sha256sums=('474c6d74e646f20424cc7ea322f02b55f6a05c238df8f93470f9959ac4e91346'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            '80036965e852d207379f91bae11a9baf957a3751f6194a1d5c047bdbb451dc9d'
            '7fa1166cfa3a8974071dda4f63b8453e3a702691d2a60740b9228a7cc13509aa'
            '9ca66e359212494be96f10736090e45eca6593f2977b83a075358456d2c51b7a'
            '5eca2e78179d9959526c7f9a034d5c688835ec65515700279372ec39e7a5a4a7')

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
