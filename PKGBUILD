pkgname=gpt4all-chat
pkgver=3.3.1
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
    "qt6-tools" "qt6-wayland" "fmt")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/nomic-ai/gpt4all/archive/refs/tags/v$pkgver.tar.gz"
    "https://gpt4all.io/models/gguf/nomic-embed-text-v1.5.f16.gguf"
    "001-change-binary-name.diff"
    "002-install-and-load-localdocs-model-more-standardly.diff"
)
declare -rAg _modules_name_map=(
    [gpt4all-backend/deps/llama.cpp-mainline]=https://github.com/nomic-ai/llama.cpp/archive/ced74fbad4b258507f3ec06e77eec9445583511a.tar.gz
    [gpt4all-backend/deps/llama.cpp-mainline/ggml/src/kompute]=https://github.com/nomic-ai/kompute/archive/aa57dff8ef45d2ec1d9f0011dcf4263606ba77b4.tar.gz
    [gpt4all-chat/deps/usearch]=https://github.com/nomic-ai/usearch/archive/22cfa3bd00ea542132ee826cdb220f9d6434bd43.tar.gz
    [gpt4all-chat/deps/usearch/fp16]=https://github.com/Maratyszcza/FP16/archive/0a92994d729ff76a58f692d3028ca1b64b145d91.tar.gz
    [gpt4all-chat/deps/usearch/simsimd]=https://github.com/ashvardanian/SimSIMD/archive/18d17686124ddebd9fe55eee56b2e0273a613d4b.tar.gz
    [gpt4all-chat/deps/usearch/stringzilla]=https://github.com/ashvardanian/StringZilla/archive/91d0a1a02faae90a41c60a30855d5935eb3eaef1.tar.gz
    [gpt4all-chat/deps/SingleApplication]=https://github.com/nomic-ai/SingleApplication/archive/21bdef01eddcbd78044eea1d50b9dee08d218ff2.tar.gz
    [gpt4all-chat/deps/fmt]=https://github.com/fmtlib/fmt/archive/0c9fce2ffefecfdce794e1859584e25877b7b592.tar.gz
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
sha256sums=('ccc14519d7627f6c6f9c3bcb09825603527ac12182443f71362df6943e0e3108'
            'f7af6f66802f4df86eda10fe9bbcfc75c39562bed48ef6ace719a251cf1c2fdb'
            'ebc6a571e828e8b31b390172374fe3667e719f6de286860934c6f6d6bfc293d3'
            'b348d6b9228316e4611186df0558f032a25ffa20334e68a91a09e07ce84db77a'
            'a91f4770ff9c39f4d72e339c379f566b3bbb359fa66122d85fc0bae3dde7abc7'
            '5f151fe3d71bb7b719eb50ed4bdedfde9c92d9d21c7eea172eec177b9875eff5'
            'b16fc2ee15a1df76e0459df32905285c94fb59135595ccbff2095167c3c865a1'
            '846ed48ef778798c1b19d5577532671ff6f2e3452b190174a9f717229f68bb46'
            'f94052c10b611fd374194ca6e0dc4d159459c0b370abfe9002c13058863b7039'
            'b5c35b9e64abe4968bd887128d94e02272072b44267c58a057a08971e3ca6806'
            '93d69bd9b40c0496380d77ef46a6896ff788f9bb518e14074649ce588bda2847'
            '3ab929011431db5d61d3153290135dd299244f407d767ba6b2c3a275213c20c8')

prepare() {
    cd "$srcdir/gpt4all-$pkgver"
    _fill_gitmodules_recursively
    patch -Np1 -i ../001-change-binary-name.diff
    patch -Np1 -i ../002-install-and-load-localdocs-model-more-standardly.diff
    sed -i "s|https://gpt4all.io/models/gguf|file://$srcdir|" gpt4all-chat/CMakeLists.txt
}
build() {
    CFLAGS+=" -DNDEBUG"
    CXXFLAGS+=" -DNDEBUG"
    cmake -B build-chat -S "$srcdir/gpt4all-$pkgver/gpt4all-chat" \
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
}
