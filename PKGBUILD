_kompute_hash=d1e3b0953cf66acc94b2e29693e221427b2c1f3f
_llama_cpp_hash=2a086f71f5b570a0f047f88d88cf5704aae7ec7c
pkgname=gpt4all-chat
pkgver=2.7.3
pkgrel=1
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
    "001-change-binary-name.diff"
    "002-allow-override-CMAKE_INSTALL_PREFIX.diff"
    "kompute-$_kompute_hash.tar.gz::https://github.com/nomic-ai/kompute/archive/$_kompute_hash.tar.gz"
    "llama.cpp-$_llama_cpp_hash.tar.gz::https://github.com/nomic-ai/llama.cpp/archive/$_llama_cpp_hash.tar.gz"
)
sha256sums=('4c7b072d93a4ba7692e65e3551ab5cb9593b29865869fd4aae26e3eecf0d24ff'
            'd9198b1ee584becf5b06622038619511dd5b0f78a71441d034dbf7324dd1439b'
            '4ed3904195fc4a281a016ec611d43630c44fc1aee06916f7a7fb8bc0a19905b5'
            'b47b1d8154a99304a406d564dfaad6dc91332b8bccc4ef15f1b2d2cce332b84b'
            '3a0be674de0d056c229f7e5bafd00b1856ed06709d85f6368a8d1abade1d6f03')

prepare() {
    cd "$srcdir/gpt4all-$pkgver"
    modules=(
        gpt4all-backend/llama.cpp-mainline
        gpt4all-backend/llama.cpp-mainline/kompute
    )
    for module in "${modules[@]}"
    do
        case $module in
            gpt4all-backend/llama.cpp-mainline/kompute)
                target=kompute-$_kompute_hash
                ;;
            gpt4all-backend/llama.cpp-mainline)
                target=llama.cpp-$_llama_cpp_hash
                ;;
        esac
        echo "Copying $module from $target..."
        cp -a "$srcdir/$target/"* "$module"
    done
    patch -Np1 -i ../001-change-binary-name.diff
    patch -Np1 -i ../002-allow-override-CMAKE_INSTALL_PREFIX.diff
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
        -DLLAMA_LTO=ON \
        -Wno-dev 
    cmake --build build-chat
}
package_gpt4all-chat() {
    DESTDIR="$pkgdir" cmake --install build-chat
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

