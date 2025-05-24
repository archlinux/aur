pkgname=gpt4all-chat
pkgver=3.10.0
pkgrel=2
pkgdesc="run open-source LLMs anywhere"
arch=("x86_64")
url="https://gpt4all.io"
license=("MIT")
depends=(
    "gcc-libs" "glibc" "qt6-base" "qt6-httpserver" "qt6-5compat" "qt6-declarative" 
    "qt6-webengine")
makedepends=(
    "cmake" "shaderc" "vulkan-tools" "vulkan-headers" "qt6-shadertools" "qt6-svg" 
    "qt6-tools" "qt6-wayland" "fmt" "ninja")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/nomic-ai/gpt4all/archive/refs/tags/v$pkgver.tar.gz"
    "https://gpt4all.io/models/gguf/nomic-embed-text-v1.5.f16.gguf"
    "001-change-binary-name.diff"
    "002-install-and-load-localdocs-model-more-standardly.diff"
)
declare -rAg _modules_name_map=(
    [gpt4all-backend/deps/llama.cpp-mainline]=https://github.com/nomic-ai/llama.cpp/archive/11f734c3b0334dbae4823b4a7467764e447fc6d6.tar.gz
    [gpt4all-backend/deps/llama.cpp-mainline/ggml/src/kompute]=https://github.com/nomic-ai/kompute/archive/7c20efa30bb53d08bf04f84e510275766ebe9923.tar.gz
    [gpt4all-chat/deps/usearch]=https://github.com/nomic-ai/usearch/archive/9e59f1036657303b29eaf709945f339e403e5f2f.tar.gz
    [gpt4all-chat/deps/usearch/fp16]=https://github.com/Maratyszcza/FP16/archive/0a92994d729ff76a58f692d3028ca1b64b145d91.tar.gz
    [gpt4all-chat/deps/usearch/simsimd]=https://github.com/ashvardanian/SimSIMD/archive/18d17686124ddebd9fe55eee56b2e0273a613d4b.tar.gz
    [gpt4all-chat/deps/usearch/stringzilla]=https://github.com/ashvardanian/StringZilla/archive/91d0a1a02faae90a41c60a30855d5935eb3eaef1.tar.gz
    [gpt4all-chat/deps/SingleApplication]=https://github.com/nomic-ai/SingleApplication/archive/21bdef01eddcbd78044eea1d50b9dee08d218ff2.tar.gz
    [gpt4all-chat/deps/fmt]=https://github.com/fmtlib/fmt/archive/0c9fce2ffefecfdce794e1859584e25877b7b592.tar.gz
    [gpt4all-chat/deps/DuckX]=https://github.com/nomic-ai/DuckX/archive/6e31dfb280e2107fbf4f6a15098c38b014f1bbcc.tar.gz
    [gpt4all-chat/deps/QXlsx]=https://github.com/nomic-ai/QXlsx/archive/29e81b369128525749dcb6516195b6b062eda955.tar.gz
    [gpt4all-chat/deps/minja]=https://github.com/nomic-ai/minja/archive/e97bb2442cd6ab3d5bb5f5a3e8a1f7d6081d613b.tar.gz
    [gpt4all-chat/deps/json]=https://github.com/nlohmann/json/archive/606b6347edf0758c531abb6c36743e09a4c48a84.tar.gz
)
_get_source_name_string() {
    local host filename name commit
    host=$(echo "$1" | cut -d / -f 3)
    name=$(echo "$1" | cut -d / -f 5)
    filename=${1##*/}
    commit=${filename%%.*}
    case "$host" in
        gitlab.com)
            # It contains $name in $commit
            echo "$commit"
            ;;
        *)
            echo "$name-$commit"
            ;;
    esac
}

_fill_gitmodules_recursively() {
    local gitmodule
    find "${1:-.}" -type f -name .gitmodules | while read -r gitmodule
    do
        local prefix
        prefix=$(dirname "$gitmodule")"/"
        if [[ "$gitmodule" =~ ^\.\/ ]]
        then
            gitmodule=${gitmodule#*\.\/}
            prefix=${prefix#*\.\/}
        fi
        echo "Parsing $gitmodule to fill submodules..."
        local p
        grep path "$gitmodule" | awk '{print $3}' | while read -r p
        do
            p=${p%$'\r'} # Remove control characters
            if [[ -n "$p" ]]
            then
                local target url name commit fname
                target="$prefix$p"
                url="${_modules_name_map[$target]}"
                fname=$(_get_source_name_string "$url")
                echo "Filling $target with $srcdir/$fname..."
                cp -r "$srcdir/$fname/." "$target"
                _fill_gitmodules_recursively "$target"
            fi
        done
    done
}
declare _source_str _uri
for _uri in "${_modules_name_map[@]}"
do
    _source_str="$(_get_source_name_string "$_uri").tar.gz::$_uri"
    if [[ "${source[*]/$_source_str/}" == "${source[*]}" ]]
    then
        source+=("$_source_str")
    fi
done
unset _source_str _uri
sha256sums=('14cfcf13de40e1bfb4df1096aac9d410bfa29d7b0c30a297bb2b3474a554f44e'
            'f7af6f66802f4df86eda10fe9bbcfc75c39562bed48ef6ace719a251cf1c2fdb'
            '828e04b4938eb192f20f87f94415252863b702bee1d9ab5f0a539a15de095350'
            'b348d6b9228316e4611186df0558f032a25ffa20334e68a91a09e07ce84db77a'
            'a91f4770ff9c39f4d72e339c379f566b3bbb359fa66122d85fc0bae3dde7abc7'
            '5f151fe3d71bb7b719eb50ed4bdedfde9c92d9d21c7eea172eec177b9875eff5'
            'b16fc2ee15a1df76e0459df32905285c94fb59135595ccbff2095167c3c865a1'
            'cf51f45eaabd9b1fccc2c871ccdd7be81730bb0172538c9375c1e33bf5ac131c'
            '78869fa23cec5faf7a6b157fbc6309202ad9c6b1f7c1392d3dc4894ffe93eb95'
            '51c6e723437ddf1ba9b4bf9951ca93e975e21b7513e268ee6e7dfc40d4aee691'
            'f94052c10b611fd374194ca6e0dc4d159459c0b370abfe9002c13058863b7039'
            '95c080489c3170b7d7c76956fe4f224a2ef721907d7b62b508e3b72a7513afd1'
            'eb366efe210279c4a34041834e2a8177e7f54a6dd3b0f258f558028325a252c4'
            '49a6d9e340474152d68478a46051b39facc5060965edc95a4b08002cfbd5eedc'
            'f5b0160e6d13a1d80f2024685e53ee6975d601f5367763a9ee1f8d45920d7816'
            '3ab929011431db5d61d3153290135dd299244f407d767ba6b2c3a275213c20c8')

prepare() {
    cd "$srcdir/gpt4all-$pkgver"
    _fill_gitmodules_recursively
    patch -Np1 -i ../001-change-binary-name.diff
    patch -Np1 -i ../002-install-and-load-localdocs-model-more-standardly.diff
    sed -i "s|https://gpt4all.io/models/gguf|file://$srcdir|" gpt4all-chat/CMakeLists.txt
    sed -i "s/vk::DynamicLoader/vk::detail::DynamicLoader/g" \
        gpt4all-backend/deps/llama.cpp-mainline/ggml/src/kompute/src/include/kompute/Manager.hpp \
        gpt4all-backend/deps/llama.cpp-mainline/ggml/src/kompute/src/Manager.cpp
    sed -i "s/vk::DispatchLoaderDynamic/vk::detail::DispatchLoaderDynamic/" \
        gpt4all-backend/deps/llama.cpp-mainline/ggml/src/kompute/src/include/kompute/Manager.hpp
    # https://github.com/KomputeProject/kompute/issues/410
    sed -i "/strtol()/ d;/ftell()/ d" \
        gpt4all-backend/deps/llama.cpp-mainline/ggml/src/kompute/external/bin/xxd.c
}
build() {
    CFLAGS+=" -DNDEBUG"
    CXXFLAGS+=" -DNDEBUG"
    cmake -B build-chat -S "$srcdir/gpt4all-$pkgver/gpt4all-chat" -G Ninja -Wno-dev \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DKOMPUTE_OPT_BUILD_SHADERS=ON \
        -DKOMPUTE_OPT_DISABLE_VULKAN_VERSION_CHECK=ON \
        -DKOMPUTE_OPT_USE_BUILT_IN_FMT=OFF \
        -DKOMPUTE_OPT_USE_BUILT_IN_VULKAN_HEADER=OFF \
        -DKOMPUTE_OPT_USE_BUILT_IN_SPDLOG=OFF \
        -DLLMODEL_KOMPUTE=ON \
        -DLLMODEL_VULKAN=OFF \
        -DLLMODEL_CUDA=OFF \
        -DLLMODEL_ROCM=OFF
    cmake --build build-chat
}
package_gpt4all-chat() {
    depends+=("hicolor-icon-theme")

    DESTDIR="$pkgdir" cmake --install build-chat
    install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/flatpak-manifest/io.gpt4all.gpt4all.desktop" \
        "$pkgdir/usr/share/applications/io.gpt4all.gpt4all.desktop"
    sed -i 's/Exec=chat/Exec=gpt4all-chat/' "$pkgdir/usr/share/applications/io.gpt4all.gpt4all.desktop"
    install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/flatpak-manifest/io.gpt4all.gpt4all.appdata.xml" \
        "$pkgdir/usr/share/metainfo/io.gpt4all.gpt4all.metainfo.xml"
    for size in 32 48
    do
        install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/icons/gpt4all-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.gpt4all.gpt4all.png"
    done
    install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/icons/gpt4all.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.gpt4all.gpt4all.svg"
    install -Dm644 "$srcdir/gpt4all-$pkgver/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/gpt4all-chat/LICENSE.txt"
    install -Dm644 "$srcdir/gpt4all-$pkgver/gpt4all-chat/LICENSE" \
        "$pkgdir/usr/share/licenses/gpt4all-chat/LICENSE_chat.txt"
    # Remove useless static linked libraries headers/archives
    rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib/cmake" "$pkgdir/usr/lib/pkgconfig" "$pkgdir/usr/lib/"*.a \
        "$pkgdir/usr/share/doc"
}
