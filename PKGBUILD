# Maintainer: Asher Buk <AshBuk@users.noreply.github.com>
# https://github.com/AshBuk/dabri

pkgname=dabri
pkgver=2.1.4
pkgrel=1
pkgdesc="Offline speech-to-text desktop application using Whisper"
arch=('x86_64' 'aarch64')
url="https://github.com/AshBuk/dabri"
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
    # SPIRV-Headers cmake config - required by whisper.cpp >= v1.8.5 Vulkan backend
    'spirv-headers'
)
options=('!lto')
# Whisper.cpp version (pinned for reproducibility)
_whisper_version=1.8.6

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/AshBuk/dabri/archive/refs/tags/v${pkgver}.tar.gz"
    "whisper-cpp-${_whisper_version}.tar.gz::https://github.com/ggml-org/whisper.cpp/archive/refs/tags/v${_whisper_version}.tar.gz"
)
sha256sums=(
    'a54b23b2c77dec3c97445ccfaddc02013216d98203caaa57397e8bc59472d2dd'
    'f8e632016ceae556f3132a16c7f704be1e7715595041f474fa81a2b64c1abf7c'
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

    # x86-only ISA extensions; on aarch64 whisper.cpp auto-detects NEON/dotprod
    local ggml_arch_flags=()
    if [[ "$CARCH" == "x86_64" ]]; then
        ggml_arch_flags=(-DGGML_AVX=ON -DGGML_AVX2=ON -DGGML_FMA=ON -DGGML_F16C=ON)
    fi

    # Build whisper.cpp libraries
    pushd build/whisper.cpp
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_RPATH="/usr/lib/${pkgname}" \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DGGML_NATIVE=OFF \
        "${ggml_arch_flags[@]}" \
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
        -tags systray,gtk \
        -ldflags "-s -w -X github.com/AshBuk/dabri/v2/internal/version.Version=${pkgver} -linkmode=external -extldflags '-Wl,-rpath,/usr/lib/${pkgname}'" \
        -o "${pkgname}" \
        ./cmd/dabri
}

check() {
    cd "${pkgname}-${pkgver}"

    export LD_LIBRARY_PATH="${PWD}/lib"
    ./"${pkgname}" --help 2>&1 | grep -q "dabri"
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
    install -Dm644 io.github.ashbuk.dabri.desktop \
        "${pkgdir}/usr/share/applications/io.github.ashbuk.dabri.desktop"

    # AppStream metainfo
    install -Dm644 io.github.ashbuk.dabri.appdata.xml \
        "${pkgdir}/usr/share/metainfo/io.github.ashbuk.dabri.appdata.xml"

    # Icons
    install -Dm644 icons/io.github.ashbuk.dabri.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.ashbuk.dabri.png"
    install -Dm644 icons/io.github.ashbuk.dabri.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.ashbuk.dabri.svg"

    # License and documentation
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
