# Maintainer: Your Name <your.email@example.com>

pkgname=dedective-git
pkgver=r22.358cc9d
pkgrel=1
pkgdesc="DECT 6.0 wideband scanner and voice decoder for the HackRF One (CLI + GUI). For authorized use on owned hardware in controlled environments only."
arch=('x86_64')
url="https://github.com/SarahRoseLives/DeDECTive"
license=('MIT')
depends=('hackrf' 'libpulse' 'sdl2' 'imgui' 'libgl')
makedepends=('cmake' 'git' 'pkgconf')
provides=('dedective')
conflicts=('dedective')
install=dedective.install
source=(
    "$pkgname::git+https://github.com/SarahRoseLives/DeDECTive.git"
    "https://raw.githubusercontent.com/ocornut/imgui/v1.92.6/backends/imgui_impl_sdl2.cpp"
    "https://raw.githubusercontent.com/ocornut/imgui/v1.92.6/backends/imgui_impl_sdl2.h"
    "https://raw.githubusercontent.com/ocornut/imgui/v1.92.6/backends/imgui_impl_opengl3.cpp"
    "https://raw.githubusercontent.com/ocornut/imgui/v1.92.6/backends/imgui_impl_opengl3.h"
    "https://raw.githubusercontent.com/ocornut/imgui/v1.92.6/backends/imgui_impl_opengl3_loader.h"
    "dedective.svg"
    "dedective_16.png"
    "dedective_22.png"
    "dedective_24.png"
    "dedective_32.png"
    "dedective_48.png"
    "dedective_64.png"
    "dedective_128.png"
    "dedective_256.png"
    "dedective_512.png"
)
sha256sums=(
    'SKIP'
    '3fad7f9862d2c9e3e495464e8400b92f1dbfb586cd4fc6e5c5255411fa9d2654'
    'd1d31f18c3375f6208a039c57a590b885e71f6af3565acbc990095fc5a08fb4e'
    'c4dcaf989498d1347706665686710cd7550e0ded3a18306c8f1bc10fd9dc0645'
    '61316c5f27f9993fb543a12db36580f4c4479e611fb36ef10cd76e17b35e2999'
    'd3aa3e1f3d23c8c88817832e17d8dd0f2d0b599ae28430067c3fad563b8b7cd5'
    'b171b76c7904a7df6132e221450f8ae49a7a55b204d031dde258474af5630923'
    'e38e58ce0c18217d063c846a3ad057bc3dc62d44b56050ab5410b94d2bbce359'
    '9285bf22484a3e65969909017537bd588f78d41104d63dd9c8da897d48eb8a21'
    'a33ab6ba083a52d4d38b31a76d56298107d48a2d5020b674b38da43c905bfeac'
    '59fc68d9ec64dcc7bac05d983d4967a999bda826e132bb8b5efb0e1c1efb57f9'
    '16eb06270abdb094c50842986b6cb683260e1d3ec8c200f23744c935bf1aca8e'
    '718add2730cb2eb35e4f8cb0d61f41482b9ea58855273f4ed479844f382982f6'
    '6f6ed11388ea41c23e001b7336848f8d192da547364d0fb4db9f8762931957ed'
    '3d2141fa23f05e60a4890ccf1b5f7d6cfd1fee1ef643a61c39eda61784f9509c'
    '8e57fad0dbb209275178eb338dcf1dfcdc5da58cadb611d969573cc9f7481ab1'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive

    # The Arch 'imgui' package (1.92.6-1) ships the compiled library and headers
    # but does not include a pkg-config file or the backend source files.
    # We handle both here without touching system paths.

    # 1. Create a local pkg-config file so cmake's pkg_check_modules(IMGUI) succeeds.
    mkdir -p "$srcdir/pkgconfig"
    cat > "$srcdir/pkgconfig/imgui.pc" << 'EOF'
prefix=/usr
libdir=${prefix}/lib
includedir=${prefix}/include

Name: imgui
Description: Dear ImGui
Version: 1.92.6
Libs: -L${libdir} -limgui
Cflags: -I${includedir}
EOF

    # 2. Collect the imgui backend sources (downloaded alongside the git source)
    #    into a single directory that we pass to cmake via -DIMGUI_BACKENDS_DIR.
    mkdir -p "$srcdir/imgui-backends"
    cp "$srcdir"/imgui_impl_sdl2.cpp \
       "$srcdir"/imgui_impl_sdl2.h \
       "$srcdir"/imgui_impl_opengl3.cpp \
       "$srcdir"/imgui_impl_opengl3.h \
       "$srcdir"/imgui_impl_opengl3_loader.h \
       "$srcdir/imgui-backends/"
}

build() {
    cd "$pkgname"

    # Expose the local pkg-config file created in prepare().
    export PKG_CONFIG_PATH="$srcdir/pkgconfig:${PKG_CONFIG_PATH}"

    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_GUI=ON \
        -DIMGUI_BACKENDS_DIR="$srcdir/imgui-backends"
    cmake --build build -j$(nproc)
}

package() {
    cd "$pkgname"

    # Install binaries
    install -Dm755 build/dedective     "$pkgdir/usr/bin/dedective"
    install -Dm755 build/dedective_gui "$pkgdir/usr/bin/dedective_gui"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create and install desktop entry
    # (No upstream .desktop file exists; generated here)
    cat > "$srcdir/dedective.desktop" << 'EOF'
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/usr/bin/dedective_gui
Name=DeDECTive
GenericName=DECT Scanner
Comment=DECT 6.0 wideband scanner and voice decoder for HackRF One
Icon=dedective
Categories=HamRadio;
Keywords=DECT;SDR;HackRF;scanner;radio;
EOF
    install -Dm644 "$srcdir/dedective.desktop" \
        "$pkgdir/usr/share/applications/dedective.desktop"

    # Install icons
    install -Dm644 "$srcdir/dedective.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/dedective.svg"
    for size in 16 22 24 32 48 64 128 256 512; do
        install -Dm644 "$srcdir/dedective_${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/dedective.png"
    done
}
