# Maintainer: rafaelff <rafaelff@gnome.org>, WeirdBeard <obarrtimothy@gmail.com>
# Contributor: éclairevoyant
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <maister@archlinux.us>

pkgname=pcsx2-git
pkgver=1.7.5865.r0.g3c15f6e42f
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=(x86_64)
url=https://github.com/PCSX2/pcsx2
license=(
    GPL2
    GPL3
    LGPL2.1
    LGPL3
)

depends=(
    libaio
    libpcap
    libglvnd
    libxrandr
    alsa-lib
    ffmpeg
    sdl2
    lld
    qt6-base
    qt6-svg
    soundtouch
    wayland
    libpng
    hicolor-icon-theme
    xcb-util-cursor
    libbacktrace-git
    )
makedepends=(
    cmake
    extra-cmake-modules
    shaderc-non-semantic-debug
    clang
    lld
    llvm
    git
    ninja
    libpulse
    libpipewire
    p7zip
    qt6-wayland
    qt6-tools
)
optdepends=(
    'qt6-wayland: Wayland support'
    'libpulse: Pulseaudio support'
    'libpipewire: Pipewire support'
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!lto)
source=(
    git+https://github.com/PCSX2/pcsx2.git
    git+https://github.com/PCSX2/pcsx2_patches.git
    git+https://github.com/google/googletest.git
    git+https://github.com/fmtlib/fmt.git
    git+https://github.com/biojppm/rapidyaml.git
    git+https://github.com/biojppm/cmake.git
    git+https://github.com/biojppm/c4core.git
    git+https://github.com/biojppm/debugbreak.git
    git+https://github.com/fastfloat/fast_float.git
    vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    pcsx2-qt.sh
)
install=pcsx2-git.install

prepare() {
    cd pcsx2
    local submodule
    _pcsx2_submodules=(
        googletest::3rdparty/gtest
        fmt::3rdparty/fmt/fmt
        rapidyaml::3rdparty/rapidyaml/rapidyaml
        vulkan-headers::3rdparty/vulkan-headers
    )
    for submodule in ${_pcsx2_submodules[@]}; do
        git submodule init "${submodule#*::}"
        git submodule set-url "${submodule#*::}" "$srcdir"/"${submodule%::*}"
        git -c protocol.file.allow=always submodule update "${submodule#*::}"
    done
    
    cd 3rdparty/rapidyaml/rapidyaml
    for submodule in ext/c4core; do
        git submodule init ${submodule}
        git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
        git -c protocol.file.allow=always submodule update ${submodule}
    done
    
    cd ext/c4core
    for submodule in cmake src/c4/ext/{debugbreak,fast_float}; do
        git submodule init ${submodule}
        git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
        git -c protocol.file.allow=always submodule update ${submodule}
    done
}

pkgver() {
    cd pcsx2
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -S pcsx2 -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
    -DSHADERC_INCLUDE_DIR=/usr/lib/shaderc-non-semantic-debug/include \
    -DSHADERC_LIBRARY=/usr/lib/shaderc-non-semantic-debug \
    -DUSE_VULKAN=ON \
    -DENABLE_SETCAP=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DX11_API=ON \
    -DWAYLAND_API=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DDISABLE_ADVANCE_SIMD=ON
    ninja -C build
    
    cd pcsx2_patches
    7z a -r ../patches.zip patches/.
}

package() {
    ls pcsx2
    install -dm755  "${pkgdir}"/opt/
    cp -r build/bin "${pkgdir}"/opt/"${pkgname%-git}"
    install -Dm755 pcsx2-qt.sh "$pkgdir"/usr/bin/pcsx2-qt
    install -Dm644 pcsx2/.github/workflows/scripts/linux/pcsx2-qt.desktop \
    "${pkgdir}"/usr/share/applications/PCSX2.desktop
    install -Dm644 pcsx2/bin/resources/icons/AppIconLarge.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/PCSX2.png
    install -Dm644 -t "${pkgdir}"/opt/"${pkgname%-git}"/resources/ patches.zip
    install -Dm644 -t "${pkgdir}"/opt/"${pkgname%-git}" "/usr/lib/shaderc-non-semantic-debug/libshaderc_shared.so.1"
}

b2sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
'956d3547f316de51de4712e6ad6cf5621efadd222ef6c1aa18508321949e63d6b3dc32cdc7eabbcb8172b4b77593485e3debe0b250ec3d0c6926170d80baf3ef')
