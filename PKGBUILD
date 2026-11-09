# lito.lock
_wavsen_commit=92f37f4748a17a36f946e64c8a4a0880cc9fbe23
_vrento_commit=550e3c1f44ccafc064eb6b4b0b320764f5b65692
_vectext_commit=36fc965d8cb418f9dc17d31683dc268dabb52cb2

pkgname=open-wallpaper-engine
pkgver=0.3.3
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
sha256sums=('ed5704d45ccf8cf6551bf33acb0d2b36b1af384090ce94ecffcf1c1a37019be5'
            'b745db138636443c8fcdf08f3265580369d1fa3eafa64e5c0821b05a7070056c'
            'fabb2fa38be16ff0f8facc1779249ce64bf5a9e05f4848082c27be8b16be0ef0'
            'd710ad4ce7b565c8a07042f5e054545ffe732013919637fa824603d86eaad293'
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
