# lito.lock
_spirv_reflect_commit=355785128c1b6ba808e3a7d0e344814fe6cff502
_wavsen_commit=73be92f4f9db0179e93e3f28d62077a2aed77a8e
_vrento_commit=a781859c940325a909c77613b5b2795cc3d65e48

pkgname=open-wallpaper-engine
pkgver=0.3.0
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 ffmpeg vulkan-icd-loader libglvnd
         "waywallen>=0.3.8" cef glslang fontconfig quickjs-ng glfw wayland)
makedepends=(lito "cmake>4.3.1" ninja git "clang>=22" lld llvm eigen vulkan-headers
             waywallen-display)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/hypengw/SPIRV-Reflect.git#commit=$_spirv_reflect_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/vecren/vrento.git#commit=$_vrento_commit"
        "0001-lito-Use-system-cef.patch")
sha256sums=('7891af872de820cb8d427f9b4086f7849a1528d0dac1f96ecd81a336e17ec1d3'
            'c033a38ac4e58e4a87ad43a84eb5e0fbe312c82b161a1fe5e38890751636f63f'
            '9f9212efdaab0379701eab6634cfd1c051ffe875f4a60b8d7a11d1c99540f85b'
            'f2f5c212bfae9f6331d25840f76ddd903ae6c22a772ae536b362c36b5bbaa3d2'
            '9b775fdccb4a86139fe5c8e50b8dee032b6aa6e11afdedc0f8798c8703393e5a')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i ../0001-lito-Use-system-cef.patch
    mkdir -p .lito
    cat > .lito/config.toml <<EOF
[patch."https://github.com/hypengw/wavsen.git"]
path = "../wavsen"

[patch."https://github.com/hypengw/SPIRV-Reflect.git"]
path = "../SPIRV-Reflect"

[patch."https://github.com/vecren/vrento.git"]
path = "../vrento"

[tools.cmake.overrides.Eigen3]
source = "installed"

[tools.cmake.overrides.glslang]
source = "installed"

[tools.cmake.overrides.qjs]
source = "installed"

[tools.cmake.overrides.CEF]
source = "installed"
EOF
    lito fetch --all-features
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
