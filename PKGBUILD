pkgname=gpt4all-chat
pkgver=3.2.0
pkgrel=1
pkgdesc="run open-source LLMs anywhere"
arch=("x86_64")
url="https://gpt4all.io"
license=("MIT")
depends=(
    "gcc-libs" "glibc" "qt6-base" "qt6-httpserver" "qt6-5compat" "qt6-quickcontrols2" 
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
    [gpt4all-backend/llama.cpp-mainline]=https://github.com/nomic-ai/llama.cpp/archive/add387854ea73d83770a62282089dea666fa266f.tar.gz
    [gpt4all-backend/llama.cpp-mainline/ggml/src/kompute]=https://github.com/nomic-ai/kompute/archive/f592b5bca3cbc169feb194218a086b18d618cca4.tar.gz
    [gpt4all-chat/usearch]=https://github.com/nomic-ai/usearch/archive/22cfa3bd00ea542132ee826cdb220f9d6434bd43.tar.gz
    [gpt4all-chat/usearch/fp16]=https://github.com/Maratyszcza/FP16/archive/0a92994d729ff76a58f692d3028ca1b64b145d91.tar.gz
    [gpt4all-chat/usearch/simsimd]=https://github.com/ashvardanian/SimSIMD/archive/18d17686124ddebd9fe55eee56b2e0273a613d4b.tar.gz
    [gpt4all-chat/usearch/stringzilla]=https://github.com/ashvardanian/StringZilla/archive/91d0a1a02faae90a41c60a30855d5935eb3eaef1.tar.gz
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
sha256sums=('02d6b4c5a0d77f38627011adbacad2983b58c3281b18bde79dd6a4af9ba9a556'
            'f7af6f66802f4df86eda10fe9bbcfc75c39562bed48ef6ace719a251cf1c2fdb'
            'ebc6a571e828e8b31b390172374fe3667e719f6de286860934c6f6d6bfc293d3'
            '29f37d9a314e5c7abe572d9fd2c5dda9dfdfcf710ba09128888e30e3c7f56e23'
            'b16fc2ee15a1df76e0459df32905285c94fb59135595ccbff2095167c3c865a1'
            'b5c35b9e64abe4968bd887128d94e02272072b44267c58a057a08971e3ca6806'
            '829ee72db790a2604fbe920e5b36b49203c5e27a1e2b65920ca78b1e04f2bf4d'
            '5f151fe3d71bb7b719eb50ed4bdedfde9c92d9d21c7eea172eec177b9875eff5'
            'a91f4770ff9c39f4d72e339c379f566b3bbb359fa66122d85fc0bae3dde7abc7'
            '8c7450f146920b7f312d51aede2ff39561fb2d926c2abd61ab136187ffaf9620')

prepare() {
    cd "$srcdir/gpt4all-$pkgver"
    declare -ra _modules=(
        gpt4all-backend/llama.cpp-mainline
        gpt4all-backend/llama.cpp-mainline/ggml/src/kompute
        gpt4all-chat/usearch
        gpt4all-chat/usearch/fp16
        gpt4all-chat/usearch/simsimd
        gpt4all-chat/usearch/stringzilla
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
