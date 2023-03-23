# Maintainer: rafaelff <rafaelff@gnome.org>, WeirdBeard <obarrtimothy@gmail.com>
# Contributor: éclairevoyant
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <maister@archlinux.us>

pkgname=pcsx2-git
pkgver=1.7.4269.r0.g72b38ce71
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
install=pcsx2-git.install
provides=(pcsx2 pcsx2-qt)
conflicts=(pcsx2)

source=(
    git+https://github.com/PCSX2/pcsx2.git
    git+https://github.com/PCSX2/xz.git
    gtest::git+https://github.com/google/googletest.git
    git+https://github.com/fmtlib/fmt.git
    git+https://github.com/microsoft/wil.git
    git+https://github.com/rtissera/libchdr.git
    git+https://github.com/biojppm/rapidyaml.git
    git+https://github.com/biojppm/cmake.git
    git+https://github.com/biojppm/c4core.git
    git+https://github.com/biojppm/debugbreak.git
    git+https://github.com/KhronosGroup/glslang.git
    git+https://github.com/fastfloat/fast_float.git
    vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
    git+https://github.com/libsdl-org/SDL.git
    git+https://github.com/nih-at/libzip.git
    git+https://github.com/facebook/zstd.git
    git+https://github.com/RetroAchievements/rcheevos.git
    0001-Fix-resources-Fix-CMake.patch
)
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
        'SKIP'
        'db0e71c76fc59f8e07684d032a3ab145eaff8964900a1690010ac1963513a050be438f651209b0cb160559c16d50d2cf5b0b8035f40c5f82e4c199d459dcec9d')

prepare()
{
    cd pcsx2
    git apply -3 ../0001-Fix-resources-Fix-CMake.patch

    local submodule
    _pcsx2_submodules=(
        3rdparty/xz/xz
        3rdparty/gtest
        3rdparty/fmt/fmt
        3rdparty/libchdr/libchdr
        3rdparty/wil
        3rdparty/rapidyaml/rapidyaml
        3rdparty/glslang/glslang
        3rdparty/vulkan-headers
        3rdparty/sdl2/SDL
        3rdparty/libzip/libzip
        3rdparty/zstd/zstd
        3rdparty/rcheevos/rcheevos
    )
    for submodule in ${_pcsx2_submodules[@]}; do
        git submodule init ${submodule}
        git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
        git -c protocol.file.allow=always submodule update ${submodule}
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

pkgver()
{
    cd pcsx2
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build()
{
    cmake -B build -S pcsx2 \
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

    ninja -C build

    cp pcsx2/.github/workflows/scripts/linux/pcsx2-qt.desktop build/bin/PCSX2.desktop
}

package()
{
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 pcsx2/pcsx2/Resources/AppIcon64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/PCSX2.png"
}

# vim: ts=2 sw=2 et:
