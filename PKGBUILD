# lito.lock
_wavsen_commit=756437443d84905a027f115c75ec6ae6b19692e7
_vrento_commit=11f19089b51acd71c5e4e9a4248bfc39927c47e4
_vectext_commit=d918972da5c08b5afc73b812062e855fce2d847d

pkgname=open-wallpaper-engine
pkgver=0.3.1
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 ffmpeg vulkan-icd-loader libglvnd
         "waywallen>=0.5.0" cef glslang fontconfig quickjs-ng glfw wayland)
makedepends=(lito "cmake>4.3.1" ninja git "clang>=22" lld llvm eigen vulkan-headers
             waywallen-display)
options=(!lto)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/vecren/vrento.git#commit=$_vrento_commit"
        "git+https://github.com/vecren/vectext.git#commit=$_vectext_commit"
        "0001-lito-Use-system-cef.patch")
sha256sums=('44bf9906d1a46b4015b598f9d0335de64e38a25ae26693439184c1e499be064b'
            'c3eb7d0d83a534f2ab489bb6dbadfc208cf735ba7d31b4d4bdbdaa5d2e75dc26'
            'b3b2f2b9f45d08e20854d6bc104598937b5407d1a0b65815cd4f03f7af46cdbc'
            'bded207cedf409fb14dfc8218ac501a5f4d7cd8e09f08c7d05655f68f0a17f0a'
            '3629af4ae0b17d055fa869f3613f9dc975e4c5e084fa9fc0e993f2f27d812212')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i ../0001-lito-Use-system-cef.patch
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
