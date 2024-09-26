# Maintainer: WeirdBeard <obarrtimothy@gmail.com>
# Contributor: rafaelff <rafaelff@gnome.org>,
# Contributor: éclairevoyant
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <maister@archlinux.us>

pkgname=pcsx2-git
pkgver=2.1.100.r0.g31b567287
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=(x86_64)
url=https://github.com/PCSX2/pcsx2
license=(
    GPLV3
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
)
makedepends=(
    cmake
    extra-cmake-modules
    clang
    lld
    llvm
    git
    ninja
    libpulse
    libpipewire
    p7zip
    ccache
    # See .github/workflows/scripts/linux/build-dependencies-qt.sh
    libjpeg-turbo
    qt6-tools
    qt6-wayland
)
optdepends=(
    'qt6-wayland: Wayland support'
    'libpulse: Pulseaudio support'
    'libpipewire: Pipewire support'
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!lto)

LIBBACKTRACE=ad106d5fdd5d960bd33fae1c48a351af567fd075
SHADERC=2024.1
SHADERC_GLSLANG=142052fa30f9eca191aa9dcf65359fcaed09eeec
SHADERC_SPIRVHEADERS=5e3ad389ee56fca27c9705d093ae5387ce404df4
SHADERC_SPIRVTOOLS=dd4b663e13c07fea4fbb3f70c1c91c86731099f7
# See .github/workflows/scripts/linux/build-dependencies-qt.sh
INSTALLDIR="${srcdir}/deps-build"

source=(
    git+https://github.com/PCSX2/pcsx2.git
    git+https://github.com/PCSX2/pcsx2_patches.git
    git+https://github.com/ianlancetaylor/libbacktrace.git#commit=$LIBBACKTRACE
    git+https://github.com/google/shaderc.git#tag=v$SHADERC
    git+https://github.com/KhronosGroup/glslang.git#commit=$SHADERC_GLSLANG
    git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=$SHADERC_SPIRVHEADERS
    git+https://github.com/KhronosGroup/SPIRV-Tools.git#commit=$SHADERC_SPIRVTOOLS
    ShaderName.patch
)
install=pcsx2-git.install

prepare() 
{
    cd "shaderc/third_party"
    mv -n ../../glslang . 
    mv -n ../../SPIRV-Headers spirv-headers
    mv -n ../../SPIRV-Tools spirv-tools
    cd ..
    patch -p1 < "${srcdir}/pcsx2/.github/workflows/scripts/common/shaderc-changes.patch"

    cd ${srcdir}/pcsx2

    patch -p1 < "${srcdir}/ShaderName.patch"
}

pkgver() {
    cd pcsx2
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() 
{
    echo "Building libbacktrace..."
    cd libbacktrace
    ./configure --prefix="${srcdir}/deps-build"
    make
    make install

    cd ${srcdir}

    echo "Building shaderc..."
    cd shaderc
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH="${srcdir}/deps-build" \
        -DCMAKE_INSTALL_PREFIX="${srcdir}/deps-build" \
        -DSHADERC_SKIP_TESTS=ON \
        -DSHADERC_SKIP_EXAMPLES=ON \
        -DSHADERC_SKIP_COPYRIGHT_CHECK=ON \
        -B build -G Ninja
    cmake --build build --parallel
    ninja -C build install
    cd ..

    mv ${srcdir}/deps-build/lib/libshaderc_shared.so.1 ${srcdir}/deps-build/lib/libshaderc_pcsx2.so.1


    # See .github/workflows/scripts/linux/generate-cmake-qt.sh
    cmake -S pcsx2 -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
    -DUSE_VULKAN=ON \
    -DENABLE_SETCAP=OFF \
    -DWAYLAND_API=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DDISABLE_ADVANCE_SIMD=ON \
    -DCMAKE_PREFIX_PATH="${srcdir}/deps-build" \
    -DPACKAGE_MODE=ON

    # Build
    ninja -C build
    
    cd pcsx2_patches
    7z a -r ../patches.zip patches/.
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 pcsx2/.github/workflows/scripts/linux/pcsx2-qt.desktop \
    "${pkgdir}"/usr/share/applications/PCSX2.desktop
    install -Dm644 pcsx2/bin/resources/icons/AppIconLarge.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/PCSX2.png
    install -Dm644 -t "${pkgdir}"/usr/share/PCSX2/resources/ patches.zip
    install -Dm644 -t "${pkgdir}"/usr/lib/ ${srcdir}/deps-build/lib/libshaderc_pcsx2.so.1
}

sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)
