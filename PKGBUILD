# Maintainer: Wojciech Dudek <wojtek.dudek.pl@gmail.com>

pkgname=waytermirror-git
pkgver=r311.ca32204
pkgrel=1
pkgdesc="Real-time Wayland screen mirroring to a terminal using Unicode braille characters, half-blocks, or ASCII. Includes bidirectional input forwarding, audio streaming (PipeWire), zooming, focus-follow, and optional NVIDIA CUDA acceleration (server-side)."
arch=('x86_64')
url="https://github.com/cyber-wojtek/waytermirror"
license=('MIT')

depends=(
    # Core runtime
    glibc
    gcc-libs

    # Wayland / compositor stack
    wayland
    wlroots0.19
    wayland-protocols
    wlr-protocols

    # Input
    libinput
    libevdev
    libwacom
    mtdev

    # IPC / multimedia
    pipewire

    # System / glib stack
    systemd-libs   # libudev
    glib2
    libffi
    pcre2

    # Compression / data
    lz4
    
    # JSON
    rapidjson

    # Opus
    opus
    opusfile

    # Sixel
    libsixel

    # FFMPEG (for H.264 encoding)
    ffmpeg

    # H264
    libx264

    # DRM (for GBM)
    libdrm

    # Mesa (for GBM)
    mesa

    # PNG (for PNG encoding)
    libpng
)

makedepends=(
    git
    gcc
    make
    pkgconf
)

optdepends=(
    'cuda: GPU-accelerated rendering via NVIDIA CUDA'
)

provides=(waytermirror)
conflicts=(waytermirror)

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd waytermirror
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd waytermirror

    # Decide CUDA mode
    local cuda=false

    if [[ -n "$WAYTERMIRROR_CUDA" ]]; then
        cuda=true
    elif [[ -n "$WAYTERMIRROR_NO_CUDA" ]]; then
        cuda=false
    elif command -v nvcc &>/dev/null; then
        cuda=true
    fi

    if $cuda; then
        echo "==> Building with CUDA support"
        meson setup builddir --buildtype=release -Dnvidia_cuda=true
    else
        echo "==> Building CPU-only"
        meson setup builddir --buildtype=release -Dnvidia_cuda=false
    fi
}

package() {
    cd waytermirror
    meson install -C builddir --destdir "$pkgdir"
}
