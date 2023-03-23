# Maintainer: rafaelff <rafaelff@gnome.org>, WeirdBeard <obarrtimothy@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <maister@archlinux.us>

pkgname=pcsx2-git
pkgver=v1.7.4268.r0.gad12a3f73
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

install=post.install

depends=(
    libaio
    libjpeg-turbo
    libpcap
    libzip
    libgl # For Steam Deck
    xorg-xrandr # For Steam Deck
    libxrender # For Steam Deck
    linux-api-headers # For Steam Deck
    libpulse
    ffmpeg
    portaudio
    libsamplerate
    sdl2
    rapidyaml
    qt6-base
    qt6-wayland
    qt6-tools
    qt6-svg
    soundtouch
    wayland
    zstd
)
makedepends=(
    cmake
    clang
    lld
    llvm
    git
    xorgproto
    ninja
    swig
    python
    vulkan-headers
)

provides=(pcsx2-qt)

conflicts=(pcsx2)

source=(
    git+https://github.com/PCSX2/pcsx2.git
    git+https://github.com/google/googletest.git
    git+https://github.com/fmtlib/fmt.git
    git+https://github.com/microsoft/wil.git
    git+https://github.com/rtissera/libchdr.git
    git+https://github.com/biojppm/rapidyaml.git
    git+https://github.com/biojppm/cmake.git
    git+https://github.com/biojppm/c4core.git
    git+https://github.com/biojppm/debugbreak.git
    git+https://github.com/KhronosGroup/glslang.git
    git+https://github.com/fastfloat/fast_float.git
    git+https://github.com/KhronosGroup/Vulkan-Headers.git
    git+https://github.com/libsdl-org/SDL.git
    git+https://github.com/nih-at/libzip.git
    git+https://github.com/facebook/zstd.git
    git+https://github.com/RetroAchievements/rcheevos.git
    0001-Fix-resources-Fix-CMake.patch
)

prepare()
{
    cd pcsx2
    git apply -3 "${srcdir}/0001-Fix-resources-Fix-CMake.patch"
    git -c protocol.file.allow=always submodule update
    local submodule
    git submodule init 3rdparty/vulkan-headers
    git submodule set-url 3rdparty/vulkan-headers "${srcdir}"/Vulkan-Headers
    git submodule update 3rdparty/vulkan-headers
    for submodule in 3rdparty/{glslang/glslang,libchdr/libchdr,rapidyaml/rapidyaml,rcheevos/rcheevos}; do
        git submodule init ${submodule}
        git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
        git submodule update ${submodule}
    done
    cd 3rdparty/rapidyaml/rapidyaml
    for submodule in ext/c4core; do
        git submodule init ${submodule}
        git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
        git submodule update ${submodule}
    done
    cd ext/c4core
    git submodule init cmake
    git submodule set-url cmake "${srcdir}"/cmake
    git submodule update cmake
    for submodule in src/c4/ext/debugbreak; do
        git submodule init ${submodule}
        git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
        git submodule update ${submodule}
    done
    for submodule in src/c4/ext/fast_float; do
        git submodule init ${submodule}
        git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
        git submodule update ${submodule}
    done
}

pkgver()
{
    cd pcsx2
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
    mkdir -p build
    cd build
    
    cmake ../pcsx2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
    -DWAYLAND_API=ON \
    -DQT_BUILD=ON \
    -DUSE_VULKAN=ON \
    -DDISABLE_ADVANCE_SIMD=ON \
    -GNinja \
    -DPACKAGE_MODE=ON
    ninja -j$(nproc)
    cd ..
    cp -r pcsx2/.github/workflows/scripts/linux/pcsx2-qt.desktop build/bin/PCSX2.desktop
}

package()
{
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 pcsx2/pcsx2/Resources/AppIcon64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/PCSX2.png"
}

# vim: ts=2 sw=2 et:

sha256sums=(
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
    'SKIP'
    'b69b3369e62bee6b6063b49621144343bb9ba81fd51f38e5e9bee4efbc731230'
)
