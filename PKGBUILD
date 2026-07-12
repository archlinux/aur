# deps.json
_spirv_reflect_tag=vulkan-sdk-1.4.321.0
_rstd_commit=ebdd90d1e770b63f89be24204b17038fe412db81
_wavsen_commit=aab112235e4da7e03c233793a9d612507f0e6355

pkgname=open-wallpaper-engine
pkgver=0.1.11
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 libpulse ffmpeg vulkan-icd-loader
         "waywallen>=0.2.3" cef glslang fontconfig quickjs-ng)
makedepends=(cmake ninja git "clang>=21" lld argparse eigen3 glad glfw vulkan-headers nlohmann-json
             waywallen-display)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git#tag=$_spirv_reflect_tag"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "0001-cmake-Use-system-cef.patch"
        "0002-cmake-Use-system-Eigen3.patch"
        "0003-cmake-Use-system-nlohmann-json.patch"
        "0004-cmake-Use-system-argparse.patch"
        "0005-cmake-Use-system-quickjs-ng.patch"
        "0006-cmake-Use-system-glslang.patch"
        "0007-cmake-Install-weweb-to-bin.patch")
sha256sums=('7cacd6ffb508d6df2824cca8cf358328d05956d520233d32c573ef69c10d1af6'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            '47938b261def2e043199960454f19d3f2d13069ec6dccd9b8aee3a96dac280b7'
            'ac96147170def04ce0bcc6f675874579db89e905d58f99b073d5ca6022aac7ef'
            'f34b627d669b5a4170cbfaabd07c6d706b976a9d1397641081dff41639e605c7'
            '06a315ca5d4234a1a8a67cf8fa8684cd092c4f7112434735f23c9fbb6e39fa63'
            'afd5ade2af834907c18b08d72736648b3d4d62bfcf9e60e74e3f54b088881f3d'
            '5c25c766ca3771d2b2003f1c4003354999f0e5025a2aae296718ec773e5d5314'
            'e693d0a4269e15067cbbfc543553a22000690e4ffe819f32c4a9db7c2e90d097'
            '93e8a95cb651873da6af0662c26cb57f5c56a0913a6e6aa3a242fe07b1d981f8'
            'c8a883641415895c448825be1a6c8a42cc2430daa92856d54ce34f5a4a255f57')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i ../0001-cmake-Use-system-cef.patch
    patch -Np1 -i ../0002-cmake-Use-system-Eigen3.patch
    patch -Np1 -i ../0003-cmake-Use-system-nlohmann-json.patch
    patch -Np1 -i ../0004-cmake-Use-system-argparse.patch
    patch -Np1 -i ../0005-cmake-Use-system-quickjs-ng.patch
    patch -Np1 -i ../0006-cmake-Use-system-glslang.patch
    patch -Np1 -i ../0007-cmake-Install-weweb-to-bin.patch
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
    install -Dvm755 -t "$pkgdir/usr/lib/$pkgname" \
        build/viewer/{Scene,Web}Viewer
}
