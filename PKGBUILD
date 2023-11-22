pkgname=gpt4all-chat
pkgver=2.5.4
pkgrel=1
pkgdesc="open-source LLM chatbots that you can run anywhere"
arch=("x86_64")
url="https://github.com/nomic-ai/gpt4all"
license=("MIT")
depends=(
    "python" "qt6-base" "qt6-httpserver" "qt6-5compat" "qt6-quickcontrols2" "qt6-shadertools"
    "qt6-svg" "qt6-wayland" "qt6-webengine" "fmt")
makedepends=("cmake" "ninja" "git" "shaderc" "vulkan-tools" "vulkan-headers")
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/gpt4all"
    git submodule update --init --recursive
}
build() {
    cmake -B build-chat -S "$srcdir/gpt4all/gpt4all-chat" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DKOMPUTE_OPT_DISABLE_VULKAN_VERSION_CHECK=ON \
        -DKOMPUTE_OPT_USE_BUILT_IN_FMT=OFF \
        -DKOMPUTE_OPT_USE_BUILT_IN_VULKAN_HEADER=OFF
    cmake --build build-chat
}
package_gpt4all-chat() {
    DESTDIR="$pkgdir" cmake --install build-chat --prefix "/usr"
    mv "$pkgdir/usr/bin/"{,gpt4all-}chat
    install -Dm644 "$srcdir/gpt4all/gpt4all-chat/flatpak-manifest/io.gpt4all.gpt4all.desktop" \
        "$pkgdir/usr/share/applications/io.gpt4all.gpt4all.desktop"
    sed -i 's/Exec=chat/Exec=gpt4all-chat/' "$pkgdir/usr/share/applications/io.gpt4all.gpt4all.desktop"
    install -Dm644 "$srcdir/gpt4all/gpt4all-chat/flatpak-manifest/io.gpt4all.gpt4all.appdata.xml" \
        "$pkgdir/usr/share/metainfo/io.gpt4all.gpt4all.metainfo.xml"
    for size in 16 32 64 128 256 512 1024
    do
        install -Dm644 "$srcdir/gpt4all/gpt4all-chat/icons/logo-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.gpt4all.gpt4all.png"
    done
    install -Dm644 "$srcdir/gpt4all/gpt4all-chat/icons/logo.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.gpt4all.gpt4all.svg"
}

