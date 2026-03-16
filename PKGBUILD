# Maintainer: Asher Buk <AshBuk@users.noreply.github.com>
# https://github.com/AshBuk/speak-to-ai

pkgname=speak-to-ai
pkgver=1.7.2
pkgrel=1
pkgdesc="Offline speech-to-text desktop application using Whisper"
arch=('x86_64')
url="https://github.com/AshBuk/speak-to-ai"
license=('MIT')
depends=(
    'gtk3'
    'libayatana-appindicator'
    'dbus'
    'alsa-utils'
    'libnotify'
    # Clipboard: X11 + Wayland
    'xsel'
    'wl-clipboard'
    # Typing: X11 + Wayland
    'xdotool'
    'wtype'
)
optdepends=(
    'ydotool: Alternative Wayland text input (better for GNOME)'
    'ffmpeg: Alternative audio recording'
    'vulkan-icd-loader: GPU acceleration via Vulkan (falls back to CPU if unavailable)'
)
makedepends=(
    'go>=1.21'
    'gcc'
    'cmake'
    'git'
    # Vulkan SDK for GPU acceleration
    'vulkan-headers'
    'shaderc'
)
options=('!lto')
# Whisper.cpp version (pinned for reproducibility)
_whisper_version=1.8.3

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/AshBuk/speak-to-ai/archive/refs/tags/v${pkgver}.tar.gz"
    "whisper-cpp-${_whisper_version}.tar.gz::https://github.com/ggml-org/whisper.cpp/archive/refs/tags/v${_whisper_version}.tar.gz"
)
sha256sums=(
    '99f8be820efdcf499c82ba584f15db2cd45e76246b3bbe067de2bb0ba9aeaaca'
    '870ba21409cdf66697dc4db15ebdb13bc67037d76c7cc63756c81471d8f1731a'
)

prepare() {
    cd "${pkgname}-${pkgver}"

    # Setup whisper.cpp
    mkdir -p build
    ln -sf "${srcdir}/whisper.cpp-${_whisper_version}" build/whisper.cpp

    # Vendor Go dependencies
    export GOFLAGS="-mod=mod"
    go mod download
}

build() {
    cd "${pkgname}-${pkgver}"

    # Build whisper.cpp libraries
    pushd build/whisper.cpp
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_RPATH="/usr/lib/${pkgname}" \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DGGML_NATIVE=OFF \
        -DGGML_AVX=ON \
        -DGGML_AVX2=ON \
        -DGGML_FMA=ON \
        -DGGML_F16C=ON \
        -DGGML_VULKAN=ON
    cmake --build build --parallel
    popd

    # Prepare lib directory for Go build
    mkdir -p lib
    cp build/whisper.cpp/build/src/libwhisper.so* lib/
    cp build/whisper.cpp/include/whisper.h lib/
    cp build/whisper.cpp/ggml/include/*.h lib/ 2>/dev/null || :
    cp build/whisper.cpp/build/ggml/src/libggml*.so* lib/ 2>/dev/null || :
    # Copy Vulkan backend library from subdirectory
    cp build/whisper.cpp/build/ggml/src/ggml-vulkan/libggml-vulkan.so* lib/ 2>/dev/null || :

    # Build Go binary with systray support
    export CGO_ENABLED=1
    export C_INCLUDE_PATH="${PWD}/lib"
    export LIBRARY_PATH="${PWD}/lib"
    export CGO_CFLAGS="-I${PWD}/lib"
    export CGO_LDFLAGS="-L${PWD}/lib -lwhisper -lggml -lggml-cpu -lggml-vulkan"
    export LD_LIBRARY_PATH="${PWD}/lib"

    go build -v \
        -tags systray \
        -ldflags "-s -w -X github.com/AshBuk/speak-to-ai/internal/version.Version=${pkgver} -linkmode=external -extldflags '-Wl,-rpath,/usr/lib/${pkgname}'" \
        -o "${pkgname}" \
        ./cmd/speak-to-ai
}

check() {
    cd "${pkgname}-${pkgver}"

    export LD_LIBRARY_PATH="${PWD}/lib"
    ./"${pkgname}" -help 2>&1 | grep -q "speak-to-ai"
}

package() {
    cd "${pkgname}-${pkgver}"

    # Binary
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Bundled whisper libraries (private prefix to avoid conflicts)
    # Install only versioned .so files and create symlinks to avoid duplicating large binaries
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"

    for lib in lib/libwhisper.so lib/libggml.so lib/libggml-base.so lib/libggml-cpu.so lib/libggml-vulkan.so; do
        [[ ! -f "$lib" ]] && continue
        base=$(basename "$lib" .so)
        # Find the fully versioned file (e.g., libwhisper.so.1.8.3)
        versioned=$(find lib -maxdepth 1 -name "${base}.so.*.*" -type f 2>/dev/null | head -1)
        if [[ -n "$versioned" ]]; then
            # Install the versioned library
            install -Dm755 "$versioned" "${pkgdir}/usr/lib/${pkgname}/"
            versioned_name=$(basename "$versioned")
            # Create symlinks: libfoo.so -> libfoo.so.X -> libfoo.so.X.Y.Z
            major=$(echo "$versioned_name" | sed -E 's/.*\.so\.([0-9]+).*/\1/')
            ln -sf "$versioned_name" "${pkgdir}/usr/lib/${pkgname}/${base}.so.${major}"
            ln -sf "${base}.so.${major}" "${pkgdir}/usr/lib/${pkgname}/${base}.so"
        else
            # No versioned file, just install as-is
            install -Dm755 "$lib" "${pkgdir}/usr/lib/${pkgname}/"
        fi
    done

    # Desktop entry
    install -Dm644 io.github.ashbuk.speak-to-ai.desktop \
        "${pkgdir}/usr/share/applications/io.github.ashbuk.speak-to-ai.desktop"

    # AppStream metainfo
    install -Dm644 io.github.ashbuk.speak-to-ai.appdata.xml \
        "${pkgdir}/usr/share/metainfo/io.github.ashbuk.speak-to-ai.appdata.xml"

    # Icons
    install -Dm644 icons/io.github.ashbuk.speak-to-ai.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.ashbuk.speak-to-ai.png"
    install -Dm644 icons/io.github.ashbuk.speak-to-ai.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.ashbuk.speak-to-ai.svg"

    # License and documentation
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
