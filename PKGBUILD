_kompute_hash=d1e3b0953cf66acc94b2e29693e221427b2c1f3f
_llama_cpp_hash=47aec1bcc09e090f0b8f196dc0a4e43b89507e4a
pkgname=gpt4all-chat
pkgver=2.6.2
pkgrel=2
pkgdesc="open-source LLM chatbots that you can run anywhere"
arch=("x86_64")
url="https://github.com/nomic-ai/gpt4all"
license=("MIT")
depends=(
    "python" "qt6-base" "qt6-httpserver" "qt6-5compat" "qt6-quickcontrols2" "qt6-shadertools"
    "qt6-svg" "qt6-wayland" "qt6-webengine" "fmt")
makedepends=("cmake" "shaderc" "vulkan-tools" "vulkan-headers")
source=(
    "https://github.com/nomic-ai/gpt4all/archive/refs/tags/v$pkgver.tar.gz"
    "kompute-$_kompute_hash.tar.gz::https://github.com/nomic-ai/kompute/archive/$_kompute_hash.tar.gz"
    "llama.cpp-$_llama_cpp_hash.tar.gz::https://github.com/nomic-ai/llama.cpp/archive/$_llama_cpp_hash.tar.gz"
)
sha256sums=('17be70359492c51f9af6294b1e892f1cd7533d965c55e48d15c416bc9600057c'
            'b47b1d8154a99304a406d564dfaad6dc91332b8bccc4ef15f1b2d2cce332b84b'
            '851826545f43158c31f96093a6e919ee2074ffbf7a55b710b41410add15c02d0')

prepare() {
    cd "$srcdir/gpt4all-$pkgver"
    rm -r gpt4all-backend/llama.cpp-mainline
    ln -s "$srcdir/llama.cpp-$_llama_cpp_hash" gpt4all-backend/llama.cpp-mainline
    rm -r gpt4all-backend/llama.cpp-mainline/kompute
    ln -s "$srcdir/kompute-$_kompute_hash" gpt4all-backend/llama.cpp-mainline/kompute
}
build() {
    cmake -B build-chat -S "$srcdir/gpt4all-$pkgver/gpt4all-chat" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKOMPUTE_OPT_BUILD_SHADERS=ON \
        -DKOMPUTE_OPT_DISABLE_VULKAN_VERSION_CHECK=ON \
        -DKOMPUTE_OPT_USE_BUILT_IN_FMT=OFF \
        -DKOMPUTE_OPT_USE_BUILT_IN_VULKAN_HEADER=OFF \
        -DKOMPUTE_OPT_USE_BUILT_IN_SPDLOG=OFF \
        -Wno-dev 
    cmake --build build-chat
}
package_gpt4all-chat() {
    DESTDIR="$pkgdir" cmake --install build-chat --prefix "/usr"
    mv "$pkgdir/usr/bin/"{,gpt4all-}chat
    install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/flatpak-manifest/io.gpt4all.gpt4all.desktop" \
        "$pkgdir/usr/share/applications/io.gpt4all.gpt4all.desktop"
    sed -i 's/Exec=chat/Exec=gpt4all-chat/' "$pkgdir/usr/share/applications/io.gpt4all.gpt4all.desktop"
    install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/flatpak-manifest/io.gpt4all.gpt4all.appdata.xml" \
        "$pkgdir/usr/share/metainfo/io.gpt4all.gpt4all.metainfo.xml"
    for size in 16 32 64 128 256 512 1024
    do
        install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/icons/logo-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.gpt4all.gpt4all.png"
    done
    install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/icons/logo.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.gpt4all.gpt4all.svg"
    install -Dm644 "$srcdir/gpt4all-$pkgver/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/gpt4all-chat/LICENSE.txt"
    install -Dm644 "$srcdir/gpt4all-$pkgver/LICENSE_SOM.txt" \
        "$pkgdir/usr/share/licenses/gpt4all-chat/LICENSE_SOM.txt"
    install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/LICENSE" \
        "$pkgdir/usr/share/licenses/gpt4all-chat/LICENSE_chat.txt"
}

