# Maintainer: flavionm <fn_maia at outlook dot com>
# Contributor: WeirdBeard <obarrtimothy@gmail.com>
# Contributor: rafaelff <rafaelff@gnome.org>,
# Contributor: éclairevoyant
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <post@themaister.net>

pkgname=pcsx2-parallel-gs-git
pkgver=2.7.520.r3.g3d366e2ba
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator with experimental paraLLEl-GS support'
arch=(x86_64)
url=https://github.com/PCSX2/pcsx2
license=(GPL-3.0-or-later)

depends=(
    alsa-lib
    ffmpeg
    hicolor-icon-theme
    libaio
    libbacktrace
    libglvnd
    libpcap
    libpng
    libxi
    libxrandr
    qt6-base
    qt6-svg
    plutosvg
    plutovg
    sdl3
    shaderc
    soundtouch
    wayland
    xcb-util-cursor
    kddockwidgets
    rapidyaml
)
makedepends=(
    7zip
    clang
    cmake
    extra-cmake-modules
    git
    libpipewire
    libpulse
    lld
    llvm
    ninja
    qt6-tools
    qt6-wayland
    vulkan-headers
)
optdepends=(
    'alsa-utils: Sound player for RetroAchievements'
    'gstreamer: Backup sound player for RetroAchievements'
    'libpipewire: Pipewire support'
    'libpulse: Pulseaudio support'
    'qt6-wayland: Wayland support'
)

provides=(pcsx2 pcsx2-git)
conflicts=(pcsx2 pcsx2-git)
options=(!lto)

source=(
    git+https://github.com/PCSX2/pcsx2.git
    git+https://github.com/Arntzen-Software/parallel-gs.git
    git+https://github.com/PCSX2/pcsx2_patches.git
    0001-Early-integration-of-parallel-GS.patch
    0002-Add-new-analog-video-options.patch
    0003-Hook-up-ImGui-UI-support.patch
)

prepare()
{
    cd ${srcdir}

    echo "Patching PCSX2 with paraLLEl-GS support ..."
    cd pcsx2
    git config user.name "local"
    git config user.email "local@local"
    git am "${srcdir}/0001-Early-integration-of-parallel-GS.patch"
    git am "${srcdir}/0002-Add-new-analog-video-options.patch"
    git am "${srcdir}/0003-Hook-up-ImGui-UI-support.patch"

    echo "Linking in parallel-gs."
    cd pcsx2/GS
    ln -sf "${srcdir}/parallel-gs" parallel-gs
    cd parallel-gs
    echo "Updating parallel-gs submodules."
    ./checkout_submodules.sh
}

pkgver() {
    cd pcsx2
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build()
{
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
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DDISABLE_ADVANCE_SIMD=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.10 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPACKAGE_MODE=ON

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
}

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'e399389c1268ea312af2b07abea673e166fdd2c25a8f09529fa873f7975011f1'
            '552bc9cd9bf0c945b3ea54a1d81c187929c7d3cf010cc14760e828b14bd3f950'
            '38ebc4639045e686e10a990cede6c072c27920471aa428ebbfadf76600803ad8')
