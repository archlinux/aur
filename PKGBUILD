# Maintainer: Brendan Szymanski <hello@bscubed.dev>

_pkgname=yuzu
pkgname=$_pkgname-mainline-git
pkgver=r21519.b9a974483
pkgrel=1
pkgdesc='An experimental open-source emulator for the Nintendo Switch (newest features)'
arch=('i686' 'x86_64')
url='https://github.com/yuzu-emu/yuzu-mainline'
license=('GPL2')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git')
depends=('desktop-file-utils'
         'fmt'
         'glslang'
         'libfdk-aac'
         'libusb'
         'libxkbcommon-x11'
         'lz4'
         'mbedtls'
         'openssl'
         'opus'
         'qt5-base'
         'qt5-multimedia'
         'qt5-tools'
         'qt5-wayland'
         'qt5-webengine'
         'sdl2'
         'shared-mime-info'
         'zlib'
         'zstd')
makedepends=('boost'
             'catch2'
             'clang'
             'cmake'
             'ffmpeg'
             'git'
             'ninja'
             'nlohmann-json'
             'robin-map')
source=("$_pkgname::git+https://github.com/yuzu-emu/yuzu-mainline"
        'git+https://github.com/benhoyt/inih.git'
        'git+https://github.com/kinetiknz/cubeb.git'
        'git+https://github.com/MerryMage/dynarmic.git'
        'libressl::git+https://github.com/citra-emu/ext-libressl-portable.git'
        'git+https://github.com/libusb/libusb.git'
        'git+https://github.com/discord/discord-rpc.git'
        'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
        'git+https://github.com/ReinUsesLisp/sirit'
        'git+https://github.com/yuzu-emu/mbedtls'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/xiph/opus.git'
        'git+https://git.ffmpeg.org/ffmpeg.git'
        'git+https://github.com/libsdl-org/SDL.git'
        'git+https://github.com/yhirose/cpp-httplib.git'
        # cubeb dependencies
        'git+https://github.com/arsenm/sanitizers-cmake.git'
        # sirit dependencies
        'git+https://github.com/KhronosGroup/SPIRV-Headers.git')
md5sums=('SKIP'
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
         'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"

    for submodule in externals/{inih/inih,cubeb,dynarmic,libressl,libusb/libusb,discord-rpc,Vulkan-Headers,sirit,mbedtls,xbyak,opus/opus,ffmpeg,SDL,cpp-httplib}; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url "$srcdir/${submodule##*/}"
        git submodule update --init
    done

    cd "$srcdir/$_pkgname"/externals/cubeb

    for submodule in cmake/sanitizers-cmake; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url "$srcdir/${submodule##*/}"
        git submodule update --init
    done
    
    cd "$srcdir/$_pkgname"/externals/sirit
    
    for submodule in externals/SPIRV-Headers; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url "$srcdir/${submodule##*/}"
        git submodule update --init
    done
}

build() {
    cd "$srcdir/$_pkgname"
    
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir -p build && cd build
    cmake .. -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_BUILD_TYPE=Release \
      -DYUZU_USE_QT_WEB_ENGINE=ON \
      -DYUZU_USE_EXTERNAL_SDL2=OFF \
      -DUSE_DISCORD_PRESENCE=ON \
      -DENABLE_QT_TRANSLATION=ON \
      -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
      -DBUILD_REPOSITORY=yuzu-emu/yuzu-mainline \
      -DBUILD_TAG=${pkgver} \
      -DTITLE_BAR_FORMAT_IDLE="yuzu | ${pkgver} {}" \
      -DTITLE_BAR_FORMAT_RUNNING="yuzu | ${pkgver} | {}" \
      -DDYNARMIC_NO_BUNDLED_ROBIN_MAP=ON \
      -DYUZU_USE_BUNDLED_OPUS=OFF \
      -DYUZU_USE_BUNDLED_FFMPEG=OFF \
      -DYUZU_USE_BUNDLED_LIBUSB=OFF \
      -DYUZU_USE_BUNDLED_QT=OFF
    ninja
}

check() {
    cd "$srcdir/$_pkgname/build"
    ninja test
}

package() {
    cd "$srcdir/$_pkgname/build"
    DESTDIR="$pkgdir" ninja install
}
