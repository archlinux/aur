# deps.json
_spirv_reflect_tag=vulkan-sdk-1.4.321.0
_rstd_commit=629bda81eb98856ca023f0f87f57dde8d22b4823
_wavsen_commit=d70d19e14437c2e1283e87e8bff43afe7c7e565d

pkgname=open-wallpaper-engine
pkgver=0.1.4
pkgrel=2
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 libpulse ffmpeg vulkan-icd-loader
         "waywallen>=0.1.5" cef glslang fontconfig quickjs-ng)
makedepends=(cmake ninja git "clang>=21" lld argparse eigen3 glad glfw vulkan-headers nlohmann-json
             waywallen-display)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git#tag=$_spirv_reflect_tag"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "0001-use-system-deps.diff")
sha256sums=('d882ac3ac286b2300d378bc9e43245d5534ca6618952efbc413d4364a9e3f75f'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            '80036965e852d207379f91bae11a9baf957a3751f6194a1d5c047bdbb451dc9d'
            'd686864c45d18763722c0ab6e2b555507a0995f8350e9e962a7251925f5f3d7d'
            '502d32116b6fba0ba8f3b0f637fed6401b40ac79ae0ea397664bb8397b77f919')

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
