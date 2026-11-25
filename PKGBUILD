# lito.lock
_wavsen_commit=fe27f752e29a94565b6a33083d90df9a020ee76f
_vrento_commit=02101d93c5fd76d8d4892910ba16765892d197c0
_vectext_commit=36fc965d8cb418f9dc17d31683dc268dabb52cb2

pkgname=open-wallpaper-engine
pkgver=0.3.4
pkgrel=2
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 ffmpeg vulkan-icd-loader libglvnd
         "waywallen>=0.6.1" cef glslang fontconfig quickjs-ng glfw wayland)
makedepends=(lito "cmake>4.3.1" ninja git "clang>=22" lld llvm eigen vulkan-headers
             waywallen-display)
options=(!lto)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/vecren/vrento.git#commit=$_vrento_commit"
        "git+https://github.com/vecren/vectext.git#commit=$_vectext_commit"
        "0001-lito-Use-system-cef.patch"
        "0002-weweb-multiplane-dmabuf-import.patch")
sha256sums=('9637b2ec6b6265745a2fe9ad31a04b37208487508c2c7e840267e22944375538'
            'e64fd2498d75a21749a71c8f82dbe534b59acb3a462b73c1e2d330538588e5c0'
            '80614f5810186112c4680d77b6535e89da162e8b17e3e302bc86e1a9d9ae3ace'
            'd710ad4ce7b565c8a07042f5e054545ffe732013919637fa824603d86eaad293'
            '3629af4ae0b17d055fa869f3613f9dc975e4c5e084fa9fc0e993f2f27d812212'
            '1c728792ff31c0f5394ef6b125413eff040f4f49c083b3be159b71465708ccd8')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i ../0001-lito-Use-system-cef.patch
    patch -Np1 -i ../0002-weweb-multiplane-dmabuf-import.patch
    mkdir -p .lito
    cat > .lito/config.toml <<EOF
[patch."https://github.com/hypengw/wavsen.git"]
path = "../wavsen"

[patch."https://github.com/vecren/vrento.git"]
path = "../vrento"

[patch."https://github.com/vecren/vectext.git"]
path = "../vectext"

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
