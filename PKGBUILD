# Maintainer: Brendan Szymanski <hello@bscubed.dev>

_pkgname=yuzu
pkgname=$_pkgname-mainline-git
pkgver=r19741.dc97cc133
pkgrel=1
pkgdesc='An experimental open-source emulator for the Nintendo Switch (newest features)'
arch=('i686' 'x86_64')
url='https://github.com/yuzu-emu/yuzu-mainline'
license=('GPL2')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git')
depends=('desktop-file-utils'
         'glslang'
         'libfdk-aac'
         'libxkbcommon-x11'
         'libzip'
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
             'cmake'
             'fmt'
             'ffmpeg'
             'git'
             'ninja'
             'nlohmann-json')
source=("$_pkgname::git+https://github.com/yuzu-emu/yuzu-mainline"
        'git+https://github.com/benhoyt/inih.git'
        'git+https://github.com/kinetiknz/cubeb.git'
        'git+https://github.com/MerryMage/dynarmic.git'
        'git+https://github.com/citra-emu/ext-soundtouch.git'
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
         'SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"

    for submodule in externals/{inih/inih,cubeb,dynarmic,soundtouch,libressl,libusb/libusb,discord-rpc,Vulkan-Headers,sirit,mbedtls,xbyak,opus/opus,ffmpeg,SDL,cpp-httplib}; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url "$srcdir/${submodule##*/}"
        git submodule update
    done

    cd "$srcdir/$_pkgname"/externals/cubeb

    for submodule in cmake/sanitizers-cmake; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url "$srcdir/${submodule##*/}"
        git submodule update
    done
    
    cd "$srcdir/$_pkgname"/externals/sirit
    
    for submodule in externals/SPIRV-Headers; do
        git submodule init ${submodule}
        git config submodule.${submodule}.url "$srcdir/${submodule##*/}"
        git submodule update
    done
}

build() {
    cd "$srcdir/$_pkgname"
    
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir -p build && cd build
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DYUZU_USE_QT_WEB_ENGINE=ON \
      -DYUZU_USE_EXTERNAL_SDL2=OFF \
      -DUSE_DISCORD_PRESENCE=ON \
      -DENABLE_QT_TRANSLATION=ON \
      -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON
    make
}

check() {
    cd "$srcdir/$_pkgname/build"
    make test
}

package() {
    cd "$srcdir/$_pkgname/build"
    make DESTDIR="$pkgdir/" install
}
