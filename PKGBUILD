# lito.lock
_spirv_reflect_commit=355785128c1b6ba808e3a7d0e344814fe6cff502
_rstd_commit=456fec5cc2b87acdb56800e298b5712ea69cdd47
_vvk_commit=f53d60cc70938d0485802750deeb15d18ba033ea
_wavsen_commit=77dfd33d07112c05df4682e08b98e19153ebe3ab

pkgname=open-wallpaper-engine
pkgver=0.2.9
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
        "git+https://github.com/litocpp/rstd.git#commit=$_rstd_commit"
        "git+https://github.com/litocpp/vvk.git#commit=$_vvk_commit"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "0001-lito-Use-system-cef.patch")
sha256sums=('19cc46690d40a7514bb601b0869e47344b28366588149db5ceca7fe727536727'
            'c033a38ac4e58e4a87ad43a84eb5e0fbe312c82b161a1fe5e38890751636f63f'
            '67e1315baa1ec31bc6d5da381b4367a08b768da623a25cc82bb84ac597647ead'
            '0abff36a8194edd20feb96e87abc772b13a2ac725c99df091ea8e08b57562f0f'
            '06c90e4fb0b996ecf07468322de9f634e35cd97b171a8c55e771da086da55ebd'
            'e9e3915ecdbb4d858cd1f610796c8d2e5b1f6a8e51e936fff7633d782d8337c7')

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
