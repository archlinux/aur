# Maintainer: rafaelff <rafaelff@gnome.org>, WeirdBeard <obarrtimothy@gmail.com>
# Contributor: éclairevoyant
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <maister@archlinux.us>

pkgname=pcsx2-git
pkgver=1.7.4378.r0.g09394ee4b
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=(x86_64)
url=https://www.pcsx2.net
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
    qt6-base
    qt6-svg
    soundtouch
    wayland
    libpng
    hicolor-icon-theme
    xcb-util-cursor
)
makedepends=(
    cmake
    clang
    lld
    llvm
    git
    ninja
    libpulse
    p7zip
    qt6-wayland
    qt6-tools
)
optdepends=(
    'qt6-wayland: Wayland support'
    'libpulse: Pulseaudio support'
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!lto)
source=(
    git+https://github.com/PCSX2/pcsx2.git
    git+https://github.com/PCSX2/pcsx2_patches.git
    xz-pcsx2::git+https://github.com/PCSX2/xz.git
    git+https://github.com/google/googletest.git
    git+https://github.com/fmtlib/fmt.git
    git+https://github.com/rtissera/libchdr.git
    git+https://github.com/biojppm/rapidyaml.git
    git+https://github.com/biojppm/cmake.git
    git+https://github.com/biojppm/c4core.git
    git+https://github.com/biojppm/debugbreak.git
    git+https://github.com/fastfloat/fast_float.git
    git+https://github.com/KhronosGroup/glslang.git
    vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    git+https://github.com/nih-at/libzip.git
    git+https://github.com/facebook/zstd.git
    git+https://github.com/RetroAchievements/rcheevos.git
    pcsx2-qt.sh
)
install=pcsx2-git.install

prepare() {
    cd pcsx2
    local submodule
    _pcsx2_submodules=(
        xz-pcsx2::3rdparty/xz/xz
        googletest::3rdparty/gtest
        fmt::3rdparty/fmt/fmt
        libchdr::3rdparty/libchdr/libchdr
        rapidyaml::3rdparty/rapidyaml/rapidyaml
        glslang::3rdparty/glslang/glslang
        vulkan-headers::3rdparty/vulkan-headers
        libzip::3rdparty/libzip/libzip
        zstd::3rdparty/zstd/zstd
        rcheevos::3rdparty/rcheevos/rcheevos
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
    -DUSE_VULKAN=ON \
    -DENABLE_SETCAP=OFF \
    -DX11_API=ON \
    -DWAYLAND_API=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DDISABLE_ADVANCE_SIMD=ON \
    -DUSE_SYSTEM_LIBS=OFF \
    -DUSE_SYSTEM_SDL2=ON \
    -DUSE_SYSTEM_ZSTD=ON \
    -DDISABLE_BUILD_DATE=ON
    ninja -C build -v
    
    7z a -r cheats_ni.zip pcsx2_patches/cheats_ni/*
    7z a -r cheats_ws.zip pcsx2_patches/cheats_ws/*
}

package() {
    install -dm755  "${pkgdir}"/opt/
    cp -r build/bin "${pkgdir}"/opt/"${pkgname%-git}"
    install -Dm755 pcsx2-qt.sh "$pkgdir"/usr/bin/pcsx2-qt
    install -Dm644 pcsx2/.github/workflows/scripts/linux/pcsx2-qt.desktop \
    "${pkgdir}"/usr/share/applications/PCSX2.desktop
    install -Dm644 pcsx2/pcsx2/Resources/AppIcon64.png \
    "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/PCSX2.png
    install -Dm644 -t "${pkgdir}"/opt/"${pkgname%-git}"/resources/ cheats_ni.zip
    install -Dm644 -t "${pkgdir}"/opt/"${pkgname%-git}"/resources/ cheats_ws.zip
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
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
'3f353f4f8e9ad778dbb972522f08766bfd7d4bc9cad57cd2154f9c8a91e07b28124491f6026534145491ca1df75060dfcff2005c8aa42d25289e3292a91dc0dd')
