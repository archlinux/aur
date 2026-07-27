# deps.json
_spirv_reflect_tag=vulkan-sdk-1.4.321.0
_rstd_commit=bf5f855ddb1b84390306e0913b89149ac72a3510
_vvk_commit=8fcfd34b43a13ade515f029b0b4209bd3684645f
_wavsen_commit=e49fc62fdc1b57abeabb643daa6ebab96fb3821f

pkgname=open-wallpaper-engine
pkgver=0.2.0
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 ffmpeg vulkan-icd-loader libglvnd
         "waywallen>=0.2.6" cef glslang fontconfig quickjs-ng glfw wayland)
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
sha256sums=('922083c9b54035ede427c66634081f3854ca539ce45f8dffed3c85c653727cf0'
            '287e451ba68eb156cf9dc6c33825e9d58fc506ea58718725c8c0f772a40a83ca'
            'a5ce0c3f766a5b75230cb05e5b9f49f52a8d10111e0391d418f27a239194e310'
            '1c2f9e285109a2024219212781202d19bbef56a68c6dff42a5622155b2d8276f'
            'd3bd59f908243f5e87f1c42e3340ee70eeaf6c86315c48726dc50fc07904791e'
            '74e3ee760d1e1d6b61e190f007a6e3b6b3743593a56b52fad60e978190f6dcdd'
            '8fd66d8e66a4ba536516945796985f9c780099128f79fb35f87ad2f6b393af5a'
            '70984f7a1e840bebb6ac67bb1f10083fc77227f85a5adbc063ebff2945bcd28f'
            '8a54c05c45ff5d625a175e5eebe57e937c04be61202447362bb4f07eec927635'
            '43320c11ff9b15b0712b35b291177e9afd50bc88d59cfcc334588f8b2df7ad59'
            'f9cff5b1745d3e4569cb3c8fd0b2bb3567054a64cc3694b0556dc194d847d787')

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
