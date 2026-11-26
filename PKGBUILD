# lito.lock
_wavsen_commit=a93fbd8f61a8dcaccbd817bcffc38db2ddf3d119
_vrento_commit=ecf0509f10ce61f124e787777f87b026ab5b6d43
_vectext_commit=4b371daf184a8067327d95ceee5a46efdd1f3f72
_vui_commit=8dc96c204bf0554476063974fa66b6cba6abd19c

pkgname=open-wallpaper-engine
pkgver=0.4.1
pkgrel=1
pkgdesc="Open source scene renderer, mostly for linux."
arch=(x86_64)
url=https://github.com/waywallen/open-wallpaper-engine
license=(GPL-2.0-only)
depends=(libgcc libstdc++ glibc lz4 freetype2 ffmpeg vulkan-icd-loader libglvnd
         "waywallen>=0.6.1" cef glslang fontconfig quickjs-ng glfw wayland)
makedepends=(lito "cmake>4.3.1" ninja git "clang>=22" lld llvm eigen vulkan-headers
             waywallen-display openal)
optdepends=('openal: For Scene spatial audio')
options=(!lto)
source=("git+https://github.com/waywallen/open-wallpaper-engine.git#tag=v$pkgver"
        "git+https://github.com/hypengw/wavsen.git#commit=$_wavsen_commit"
        "git+https://github.com/vecren/vrento.git#commit=$_vrento_commit"
        "git+https://github.com/vecren/vectext.git#commit=$_vectext_commit"
        "git+https://github.com/vecren/vui.git#commit=$_vui_commit"
        "0001-lito-Use-system-cef.patch")
sha256sums=('6e67bf67a730a3e09be07de5de3f2e9c1ad5be74f9d5858c9d5809f5b13a07c0'
            '9d6a8347f623fd1eac1b527585a5344305084cdb266f54af4e9da61b5108f5e3'
            '4c46799da28f2ad621d35eee7587fd2574ec3c50721e83f389474d0f98c45cbc'
            '46fba7fef15a04a607c4eb09ec5d6586c1f6ebdd91f7dc6c3e43417e1401c7a5'
            '22ce25a06faa0d756e54883329576aceb23c71ac69fa051276b9e74291fc884c'
            'd2670b5679973ce492adccbd3761066da6a147fb0d162c004cfb3f0b93210f91')

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

[patch."https://github.com/vecren/vui.git"]
path = "../vui"

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

    lito -C "$pkgname" build --profile plain --use-env-flags
}
package() {
    lito -C "$pkgname" install --profile plain --no-build --prefix="$pkgdir/usr" \
        --package owe-waywallen-plugin
}
