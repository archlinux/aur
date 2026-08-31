# Maintainer: flavionm <fn_maia at outlook dot com>
# Contributor: WeirdBeard <obarrtimothy@gmail.com>
# Contributor: rafaelff <rafaelff@gnome.org>,
# Contributor: éclairevoyant
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <post@themaister.net>

pkgname=pcsx2-parallel-gs-git
pkgver=2.9.9.r3.g7d25973fd3
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator with experimental paraLLEl-GS support'
arch=(x86_64)
url=https://github.com/PCSX2/pcsx2
license=(GPL-3.0-or-later)

depends=(
    dbus
    ffmpeg
    hicolor-icon-theme
    curl
    libbacktrace
    libglvnd
    libpcap
    libpng
    libxi
    libxrandr
    qt6-base
    freetype2
    glibc
    libgcc
    libjpeg-turbo
    libstdc++
    libwebp
    libx11
    lz4
    systemd-libs
    zlib
    zstd
    plutosvg
    plutovg
    sdl3
    shaderc
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
    'noto-fonts: System font support'
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
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DCMAKE_PREFIX_PATH="${srcdir}/deps-build" \
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
            '7987fe856d5d1b76c542ceda4c9dfb76f89a70044a6ed7f736633c04785d5559'
            'd8385c21c9e7ee3b6b676ae330d8af26dc0c910c76299329b782ca96a4cea742'
            'bccbf27e2c545dea9d95b20ba9bf9adeb3fd75bff5cf782e91dcd79d6c04e4c0')
