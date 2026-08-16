# Maintainer: Nadir <boussou@gmail.com>
pkgname=opons-voxd
pkgver=20260816.441ed9f
pkgrel=1
pkgdesc="Local speech-to-text dictation for Linux (whisper.cpp, GTK3 tray app)"
url="https://github.com/boussou/opons-voxd"
license=(MIT)
arch=(x86_64)
depends=(gtk3 libnotify xclip portaudio libxtst)
makedepends=(gcc make cmake pkgconf git)
source=(
    "opons-voxd::git+https://github.com/boussou/opons-voxd.git#commit=441ed9fc501881883706bf7d8c2f6868fc4397cf"
    "whisper.cpp::https://github.com/ggerganov/whisper.cpp/archive/1fe009caeda75f69bc864d6370b10674e45a92bd.tar.gz"
    "portaudio.h::https://raw.githubusercontent.com/PortAudio/portaudio/v19.7.0/include/portaudio.h"
)
md5sums=(
    SKIP
    '06ae5d65d57a8e3a99cefdb38c2d1d4a'
    'b37feea97ab912bff55efb7e43b49cad'
)

_whisper_commit=1fe009caeda75f69bc864d6370b10674e45a92bd

pkgver() {
    cd "$srcdir/opons-voxd"
    printf '%s.%s' \
        "$(git log -1 --format=%cd --date=format:%Y%m%d)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/opons-voxd"

    cp -r "$srcdir/whisper.cpp-$_whisper_commit" whisper.cpp

    mkdir -p vendor/portaudio
    cp "$srcdir/portaudio.h" vendor/portaudio/

    # Patch: disable -compress-mode=... which leaks to host compiler (gcc)
    # in some CMake/nvcc combos and breaks the CUDA build.
    sed -i \
        's|if (CUDAToolkit_VERSION VERSION_GREATER_EQUAL "12.8")|if (FALSE AND CUDAToolkit_VERSION VERSION_GREATER_EQUAL "12.8")|' \
        whisper.cpp/ggml/src/ggml-cuda/CMakeLists.txt || true
}

build() {
    cd "$srcdir/opons-voxd"

    # --- CUDA auto-detection (mirrors the project Makefile) ---
    local nvcc="" cudart="" p
    for p in /usr/local/cuda/bin/nvcc /opt/cuda/bin/nvcc; do
        if [ -x "$p" ]; then
            nvcc="$p"
            break
        fi
    done
    [ -n "$nvcc" ] || nvcc="$(command -v nvcc || true)"
    for p in /usr/local/cuda/lib64/libcudart.so \
             /opt/cuda/targets/x86_64-linux/lib/libcudart.so; do
        if [ -e "$p" ]; then
            cudart="$p"
            break
        fi
    done

    local cuda_cmake="" cuda_libs="" arch=""
    if [ -n "$nvcc" ] && [ -n "$cudart" ]; then
        arch="$(nvidia-smi --query-gpu=compute_cap --format=csv,noheader \
            2>/dev/null | head -n1 | awk -F. '{ if ($1 != "") print $1 $2 "-real" }')"
        cuda_cmake="-DGGML_CUDA=ON -DCMAKE_CUDA_COMPILER=$nvcc"
        [ -n "$arch" ] && \
            cuda_cmake="$cuda_cmake -DCMAKE_CUDA_ARCHITECTURES=$arch"
        cuda_libs="-L$(dirname "$cudart") -lcudart -lcublas -lcublasLt -lcuda"
        echo "[build] CUDA detected (nvcc=$nvcc, arch=${arch:-default})"
    else
        echo "[build] CUDA not found — CPU only"
    fi

    cmake -S whisper.cpp -B whisper.cpp/build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=OFF \
        -DWHISPER_BUILD_EXAMPLES=OFF \
        -DWHISPER_BUILD_TESTS=OFF \
        $cuda_cmake

    cmake --build whisper.cpp/build -j"$(nproc)" --target whisper

    local pkg_cflags pkg_libs
    pkg_cflags="$(pkg-config --cflags gtk+-3.0 libnotify x11 xtst)"
    pkg_libs="$(pkg-config --libs gtk+-3.0 libnotify x11 xtst)"

    gcc -O2 -Wall -Wextra -Wno-unused-parameter -Wno-deprecated-declarations \
        -std=c11 \
        -Iwhisper.cpp/include -Iwhisper.cpp/ggml/include -Ivendor/portaudio \
        $pkg_cflags \
        opons_voxd.c -o opons-voxd \
        -Wl,--start-group $(find whisper.cpp/build -name 'lib*.a') \
        -Wl,--end-group \
        $pkg_libs -l:libportaudio.so.2 $cuda_libs \
        -lm -lpthread -lstdc++ -fopenmp
}

package() {
    cd "$srcdir/opons-voxd"

    install -Dm755 opons-voxd -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/opons-voxd"
    install -Dm644 commands/*.txt -t "$pkgdir/usr/share/opons-voxd/commands"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/opons-voxd.desktop" \
        <<'EOF'
[Desktop Entry]
Type=Application
Name=opons-voxd
Comment=Local speech-to-text dictation
Exec=/usr/bin/opons-voxd-launch
Path=/usr/share/opons-voxd
Icon=audio-input-microphone
Terminal=false
StartupNotify=false
Categories=Audio;AudioVideo;
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/opons-voxd-launch" \
        <<'EOF'
#!/bin/sh
# Desktop menu launcher: points OPONS_VOXD_MODEL at the per-user model
# directory (populated by opons-voxd-fetch-model). A user-set
# OPONS_VOXD_MODEL always wins.
exec env OPONS_VOXD_MODEL="${OPONS_VOXD_MODEL:-$HOME/.local/share/opons-voxd/models/ggml-medium.bin}" \
    /usr/bin/opons-voxd
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/opons-voxd-fetch-model" \
        <<'EOF'
#!/bin/sh
# Download a Whisper GGML model for opons-voxd.
# Usage: opons-voxd-fetch-model [tiny|base|small|medium|large-v3-turbo]
set -eu

model="${1:-medium}"
dest_dir="${OPONS_VOXD_MODEL_DIR:-$HOME/.local/share/opons-voxd/models}"
file="ggml-$model.bin"
url="https://huggingface.co/ggerganov/whisper.cpp/resolve/main/$file"

mkdir -p "$dest_dir"
cd "$dest_dir"

if [ -f "$file" ]; then
    echo "$file already present in $dest_dir — skipping download."
    exit 0
fi

echo "Downloading $file from $url"
if command -v wget2 >/dev/null 2>&1; then
    wget2 -O "$file.part" "$url"
elif command -v curl >/dev/null 2>&1; then
    curl -fL --retry 3 -o "$file.part" "$url"
else
    wget -O "$file.part" "$url"
fi
mv -f "$file.part" "$file"

echo "Model installed to $dest_dir/$file"
echo "Run: OPONS_VOXD_MODEL=$dest_dir/$file opons-voxd"
EOF

    msg "opons-voxd: the Whisper model is not bundled (~1.5 GB for medium)."
    msg "Run 'opons-voxd-fetch-model' to download it (optional arg: tiny, small, large-v3-turbo)."
}
md5sums=('c3c6a3867d14b81d3cc2af38bcc12e1e'
         '06ae5d65d57a8e3a99cefdb38c2d1d4a'
         'b37feea97ab912bff55efb7e43b49cad')
