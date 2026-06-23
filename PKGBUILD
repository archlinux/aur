# deps.json
_spirv_reflect_tag=vulkan-sdk-1.4.321.0
_rstd_commit=b3b3243ed1fe242968879401bbb9c8637169414f
_wavsen_commit=107f2aeab439276c5b7271658b7df1f4ab0ed028

pkgname=open-wallpaper-engine
pkgver=0.1.8
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 libpulse ffmpeg vulkan-icd-loader
         "waywallen>=0.2.2" cef glslang fontconfig quickjs-ng)
makedepends=(cmake ninja git "clang>=21" lld argparse eigen3 glad glfw vulkan-headers nlohmann-json
             waywallen-display)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver-fix"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git#tag=$_spirv_reflect_tag"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "0001-use-system-deps.diff")
sha256sums=('733696e47ad942d1292c3c2767f1a31f9cbebcc95ebfd1d01f51ebc89f5160d8'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            '2ebbd8684784fcd69f26515fcd73d868b67996f93b3a4cb1b54f2e197ff11888'
            '9551eafef6c78a5ce380bd3ae97a68383689a473d68253f03edced3694a9c48f'
            'd08ea72bfa0cfdc5454bb9f3c13f1a33a2965b861c7d8373a5f23d068683d68e')

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
        -DCMAKE_LINKER_TYPE=LLD \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_SPIRV_REFLECT="$srcdir/SPIRV-Reflect" \
        -DFETCHCONTENT_SOURCE_DIR_RSTD="$srcdir/rstd" \
        -DFETCHCONTENT_SOURCE_DIR_WAVSEN="$srcdir/wavsen"
    cmake --build build
}
package() {
    DESTDIR="$pkgdir" cmake --install build
}
