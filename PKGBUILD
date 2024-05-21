pkgname=gpt4all-chat
pkgver=2.7.5
pkgrel=2
pkgdesc="run open-source LLMs anywhere"
arch=("x86_64")
url="https://gpt4all.io"
license=("MIT")
depends=(
    "python" "qt6-base" "qt6-httpserver" "qt6-5compat" "qt6-quickcontrols2" "qt6-shadertools"
    "qt6-svg" "qt6-wayland" "qt6-webengine" "fmt")
makedepends=("cmake" "shaderc" "vulkan-tools" "vulkan-headers")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/nomic-ai/gpt4all/archive/refs/tags/v$pkgver.tar.gz"
    "001-change-binary-name.diff"
    "002-fix-include-algorithm.diff"
)
declare -rAg _modules_name_map=(
    [gpt4all-backend/llama.cpp-mainline]=https://github.com/nomic-ai/llama.cpp/archive/a3f03b7e793ee611c4918235d4532ee535a9530d.tar.gz
    [gpt4all-backend/llama.cpp-mainline/kompute]=https://github.com/nomic-ai/kompute/archive/d1e3b0953cf66acc94b2e29693e221427b2c1f3f.tar.gz
)
declare _uri _name _commit _source_str
for _uri in "${_modules_name_map[@]}"
do
    _name=$(echo "$_uri" | cut -d / -f 5)
    _commit=${_uri##*/}
    if [[ "$_commit" == *-* ]]
    then
        _source_str="$_commit::$_uri"
    else
        _source_str="$_name-$_commit::$_uri"
    fi
    if [[ "${source[*]/$_source_str/}" == "${source[*]}" ]]
    then
        source+=("$_source_str")
    fi
done
sha256sums=('6849bfa2956019a3f24e350984fe9114b0c6e71932665640f770549d20721243'
            'c9f1242ff0dfd7367387d5e7d228b808cdb7f6a0a368ba37e326afb21c603a44'
            '33353c4d0d7a5da7862c4965cf4e69452dda68d2dca184c38208cd6d20746913'
            'b47b1d8154a99304a406d564dfaad6dc91332b8bccc4ef15f1b2d2cce332b84b'
            '2fef47fc74c8ccc32b33b8c83f9833b6a4c02e09da8d688abb6ee35167652ea9')

prepare() {
    cd "$srcdir/gpt4all-$pkgver"
    declare -ra _modules=(
        gpt4all-backend/llama.cpp-mainline
        gpt4all-backend/llama.cpp-mainline/kompute
    )
    declare _module _uri _name _commit _fname
    for _module in "${_modules[@]}"
    do
        _uri=${_modules_name_map[$_module]}
        _name=$(echo "$_uri" | cut -d / -f 5)
        _commit=${_uri##*/}
        if [[ "$_commit" == *-* ]]
        then
            _fname="${_commit%%.*}"
        else
            _fname=$_name-${_commit%%.*}
        fi
        echo "Copying $_module from $_fname"
        if [[ -d "$_module" ]]
        then
            cp -r "$srcdir/$_fname/"* "$_module"
        else
            cp -r "$srcdir/$_fname" "$_module"
        fi
    done
    patch -Np1 -i ../001-change-binary-name.diff
    patch -Np1 -i ../002-fix-include-algorithm.diff
}
build() {
    cmake -B build-chat -S "$srcdir/gpt4all-$pkgver/gpt4all-chat" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKOMPUTE_OPT_BUILD_SHADERS=ON \
        -DKOMPUTE_OPT_DISABLE_VULKAN_VERSION_CHECK=ON \
        -DKOMPUTE_OPT_USE_BUILT_IN_FMT=OFF \
        -DKOMPUTE_OPT_USE_BUILT_IN_VULKAN_HEADER=OFF \
        -DKOMPUTE_OPT_USE_BUILT_IN_SPDLOG=OFF
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

