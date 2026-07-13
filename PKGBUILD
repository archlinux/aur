# deps.json
_spirv_reflect_tag=vulkan-sdk-1.4.321.0
_rstd_commit=be7dbc466e5f6623def638e18dac39f70d06ebe4
_wavsen_commit=72c43fab3dbe0df17b64f76e8e6198037bfd3c60

pkgname=open-wallpaper-engine
pkgver=0.1.12
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc glibc lz4 freetype2 libpulse ffmpeg vulkan-icd-loader libglvnd
         "waywallen>=0.2.3" cef glslang fontconfig quickjs-ng glfw wayland)
makedepends=(cmake ninja git "clang>=21" lld argparse eigen3 vulkan-headers
             waywallen-display)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver-fix"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git#tag=$_spirv_reflect_tag"
        "git+https://github.com/hypengw/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "0001-cmake-Use-system-cef.patch"
        "0002-cmake-Use-system-Eigen3.patch"
        "0003-cmake-Use-system-argparse.patch"
        "0004-cmake-Use-system-quickjs-ng.patch"
        "0005-cmake-Use-system-glslang.patch"
        "0006-cmake-Install-weweb-to-bin.patch")
sha256sums=('d0549b252ce3bd65bf42451f78ffebf55a09be227254fd787f51758d45f53ce0'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            'af0c738eb5eb2a36ce43f4a26b00c3d5d591c22df153b72edefd2f4e7fc3c878'
            'e395a8f8045fcdee0380e5a9db376129153071986d83f39d950d7f8527c009e9'
            '09e3a30b003188fd9f681841463953f4fef60a5e2c8e3745958ce97e8cbf9e9b'
            '8c8604b1e015a8b70e6cd9ffd571ecc3dfeb9d08b2d68709966d7d7896849b28'
            'f7c2aa4fee1db23250f4a9a2df2e88e7778228044fcec4d2170fef333f3e5593'
            '6f6c460e5f19e4705180054a2993fc2ff0c7e247d5c81e0c3c0f3378f9a8b69e'
            'a35b09dcb1db6ae887d18084baa326956ebcc060bfbcd4dedd399bbbe86a3892'
            '8b87dd4da98cb918114a4555e239173f5eef11c6c7ec6e12a47df88018e5f606')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i ../0001-cmake-Use-system-cef.patch
    patch -Np1 -i ../0002-cmake-Use-system-Eigen3.patch
    patch -Np1 -i ../0003-cmake-Use-system-argparse.patch
    patch -Np1 -i ../0004-cmake-Use-system-quickjs-ng.patch
    patch -Np1 -i ../0005-cmake-Use-system-glslang.patch
    patch -Np1 -i ../0006-cmake-Install-weweb-to-bin.patch
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
