# lito.lock
_spirv_reflect_commit=355785128c1b6ba808e3a7d0e344814fe6cff502
_rstd_version=0.1.2
_vvk_commit=117626d9bfc6c1de0f2957f7fa42b47935bb6af8
_wavsen_commit=294cf8156e5130122bdfca65e0401aee7a29e6d8

pkgname=open-wallpaper-engine
pkgver=0.2.10
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 ffmpeg vulkan-icd-loader libglvnd
         "waywallen>=0.3.8" cef glslang fontconfig quickjs-ng glfw wayland)
makedepends=(lito "cmake>4.3.1" ninja git "clang>=22" lld llvm eigen vulkan-headers
             waywallen-display vulkan-memory-allocator)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/hypengw/SPIRV-Reflect.git#commit=$_spirv_reflect_commit"
        "git+https://github.com/litocpp/rstd.git#tag=v$_rstd_version"
        "git+https://github.com/litocpp/vvk.git#commit=$_vvk_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "0001-lito-Use-system-cef.patch")
sha256sums=('339321965b9f606a0aae4e7cd7dc34377ad74f35bda7eaa20563e75521d08278'
            'c033a38ac4e58e4a87ad43a84eb5e0fbe312c82b161a1fe5e38890751636f63f'
            '9d7e6a4cbf1eb690e7d64af05dd7f9fc3730bf817b1152bbd99892f20101ce2d'
            'f49079a367c7759207d56d49789f5f7c0bfa99b1a3d204566aeceddd9f097b67'
            '3c737584b5e073ee85ad0f81203971d1bd1da1ad612fbaad724e063e1aa58aa4'
            'b9ad138e621d6e5962e9f8bc701e947103ad36fd0f9889c53eb24f4abecc4d78')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i ../0001-lito-Use-system-cef.patch
    mkdir -p .lito
    cat > .lito/config.toml <<EOF
[patch."https://github.com/litocpp/rstd.git"]
path = "../rstd"

[patch."https://github.com/hypengw/wavsen.git"]
path = "../wavsen"

[patch."https://github.com/litocpp/vvk.git"]
path = "../vvk"

[patch."https://github.com/hypengw/SPIRV-Reflect.git"]
path = "../SPIRV-Reflect"

[tools.cmake.overrides.Eigen3]
source = "installed"

[tools.cmake.overrides.glslang]
source = "installed"

[tools.cmake.overrides.qjs]
source = "installed"

[tools.cmake.overrides.CEF]
source = "installed"

[tools.cmake.overrides.VulkanMemoryAllocator]
source = "installed"
EOF
}
build() {
    # https://github.com/llvm/llvm-project/issues/121709
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}"

    # /usr/src/cef/libcef_dll/ctocpp/ctocpp_ref_counted.h:136:26:
    # error: instantiation of variable 'CefCToCppRefCounted<CefBrowserCToCpp, CefBrowser, _cef_browser_t>::kWrapperType' required here, but no definition is available [-Werror,-Wundefined-var-template]
    # /build/open-wallpaper-engine/src/open-wallpaper-engine/viewer/VulkanBlitter.hpp:94:30:
    # error: private field 'frame_index_' is not used [-Werror,-Wunused-private-field]
    CXXFLAGS+=" -Wno-error=undefined-var-template -Wno-error=unused-private-field"

    lito -C "$pkgname" build --profile plain --use-env-flags \
        --package owe-sceneviewer \
        --package owe-webviewer \
        --package owe-waywallen-scene-renderer \
        --package owe-waywallen-web-renderer
}
package() {
    lito -C "$pkgname" install --profile plain --no-build --prefix="$pkgdir/usr" \
        --package owe-waywallen-plugin
    install -Dvm755 -t "$pkgdir/usr/lib/$pkgname" \
        "$pkgname/build/plain/bin/owe-sceneviewer/SceneViewer" \
        "$pkgname/build/plain/bin/owe-webviewer/WebViewer"
}
