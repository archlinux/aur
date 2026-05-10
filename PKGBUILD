# deps.json
_spirv_reflect_commit=e55086b044225f9b511ae44dbf9b079d3625943f
_rstd_commit=f4f45c507d3d69fd6b31e3139c0d63a57622c0d0
_wavsen_commit=24bade549e5059dbfa02e61df1a4b4a928f5eef7
_quickjs_commit=3c051980ab7e783dfbfb1c70c014ce5e05ecf24c

pkgname=open-wallpaper-engine
pkgver=0.1.0
pkgrel=2
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
sha256sums=('eedefbf3192f04d97027667b7cd7541e475f15146bbf9ac566daf49c246a38df'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            '51783e07b586d7d44884d935201308df4e0425a5614731fef167f0fa2ea22a7d'
            '8b94d8c0fd2bd8e7f49200d839bbb9cd1a633a99d4c648743f1ef3b27165e2b8'
            '9ca66e359212494be96f10736090e45eca6593f2977b83a075358456d2c51b7a'
            'bcc157c371849e163155fc789ec6ec52293a62f44ec1b47004c5315c1f1464cc')

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
