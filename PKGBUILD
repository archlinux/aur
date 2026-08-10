# deps.json
_spirv_reflect_tag=vulkan-sdk-1.4.321.0
_rstd_commit=03b022f37aa414c22a47021d58e054d55927c6c1
_vvk_commit=867852dea22504db27559df60b74fee4c66406c7
_wavsen_commit=a76c68e55e24c7e87fc5dbae28ee5d3b24139724

pkgname=open-wallpaper-engine
pkgver=0.2.3
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 ffmpeg vulkan-icd-loader libglvnd
         "waywallen>=0.3.2" cef glslang fontconfig quickjs-ng glfw wayland)
makedepends=('cmake<4.4' ninja git "clang>=21" lld eigen vulkan-headers waywallen-display
             vulkan-memory-allocator)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/KhronosGroup/SPIRV-Reflect.git#tag=$_spirv_reflect_tag"
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/vvk.git#commit=$_vvk_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "0001-cmake-Use-system-cef.patch"
        "0002-cmake-Use-system-Eigen.patch"
        "0003-cmake-Use-system-quickjs-ng.patch"
        "0004-cmake-Use-system-glslang.patch"
        "0005-cmake-Use-system-VulkanMemoryAllocator.patch"
        "0006-cmake-Install-weweb-to-bin.patch")
sha256sums=('fa8d8a53108015e7f796d372b673c5828639d9362297b9dab763f739e9a7e500'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            '89e9f424fe3719b8bda1380f0cc446fc96d9662668d012752de73cbc0d06a2ef'
            '3b0c5ca0bbeb7c84df483bf098ba9105bb79316417a409bb6ef4b2b2513f6e06'
            '3a7bcf987730ca3eab923ce1758538cc5ce26ec5f9787aa166fdd875936ba61e'
            '8abc6ecd2993ce6eddf418a46fd088a0515b3ead9e2c99aeedfa223cf1b0eac9'
            'e5fd3a65a6ec7e0a3ef03a82ff298ec0b1ace56b89f11ed2e94e4bcac7d9d074'
            '444c3bd38a62d167f19e44cf71244230ba7aa538787117a20ba3e13e974b1dc1'
            'e1bd31c20595c052578c5942acaebbcf750a4c3475d208ec4a0bd10db5fcb791'
            'c4950f393f0130e00307bd7380b6ef6089ec504b6bc01af1c894ce660842ff88'
            'f81b55b4bb30a2143cd3252aa14f0abb1ec4932261aef080121f4581987e5c7d')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i ../0001-cmake-Use-system-cef.patch
    patch -Np1 -i ../0002-cmake-Use-system-Eigen.patch
    patch -Np1 -i ../0003-cmake-Use-system-quickjs-ng.patch
    patch -Np1 -i ../0004-cmake-Use-system-glslang.patch
    patch -Np1 -i ../0005-cmake-Use-system-VulkanMemoryAllocator.patch
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
        -DFETCHCONTENT_SOURCE_DIR_VVK="$srcdir/vvk" \
        -DFETCHCONTENT_SOURCE_DIR_WAVSEN="$srcdir/wavsen"
    cmake --build build
}
package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dvm755 -t "$pkgdir/usr/lib/$pkgname" \
        build/viewer/{Scene,Web}Viewer
}
