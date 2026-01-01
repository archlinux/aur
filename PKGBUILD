# Maintainer: Wojciech Dudek <wojtek.dudek.pl@gmail.com>

pkgname=waytermirror-git
pkgver=r12.798cb81
pkgrel=1
pkgdesc="Mirror Wayland desktop to terminal using braille/block characters"
arch=('x86_64')
url="https://github.com/cyber-wojtek/waytermirror"
license=('Apache-2.0')

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

    # Scripting / config
    lua

    # JSON
    rapidjson
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
        make CUDA=true
    else
        echo "==> Building CPU-only"
        make CUDA=false
    fi
}

package() {
    cd waytermirror

    install -Dm755 waytermirror_server \
        "$pkgdir/usr/bin/waytermirror_server"

    install -Dm755 waytermirror_client \
        "$pkgdir/usr/bin/waytermirror_client"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
