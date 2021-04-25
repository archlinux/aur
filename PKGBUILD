# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
# Co-maintainer: Brendan Szymanski <bscubed@pm.me>

_pkgname=yuzu
pkgname=$_pkgname-git
pkgver=r17729.2ff39f6fd
pkgrel=1
pkgdesc='An experimental open-source Nintendo Switch emulator/debugger'
arch=('i686' 'x86_64')
url='https://github.com/yuzu-emu/yuzu'
license=('GPL2')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-mainline-git' 'yuzu-canary-git')
depends=('desktop-file-utils'
         'glslang'
         'libxkbcommon-x11'
         'libfdk-aac'
         'lz4'
         'openssl'
         'qt5-base'
         'qt5-multimedia'
         'qt5-tools'
         'qt5-wayland'
         'qt5-webengine'
         'sdl2'
         'shared-mime-info'
         'zlib'
         'zstd')
makedepends=('catch2' 'cmake' 'fmt' 'git' 'nlohmann-json')
source=("$_pkgname::git+https://github.com/yuzu-emu/yuzu"
        'git+https://github.com/benhoyt/inih.git'
        'git+https://github.com/kinetiknz/cubeb.git'
        'git+https://github.com/MerryMage/dynarmic.git'
        'git+https://github.com/citra-emu/ext-soundtouch.git'
        'libressl::git+https://github.com/citra-emu/ext-libressl-portable.git'
        'git+https://github.com/libusb/libusb.git'
        'git+https://github.com/discordapp/discord-rpc.git'
        'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
        'git+https://github.com/ReinUsesLisp/sirit'
        'git+https://github.com/yuzu-emu/mbedtls'
        'git+https://github.com/nih-at/libzip.git'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/xiph/opus.git'
        'git+https://git.ffmpeg.org/ffmpeg.git'
        'git+https://github.com/libsdl-org/SDL.git'
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

    for submodule in externals/{inih/inih,cubeb,dynarmic,soundtouch,libressl,libusb/libusb,discord-rpc,Vulkan-Headers,sirit,mbedtls,libzip/libzip,xbyak,opus/opus,ffmpeg,SDL}; do
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
    
    # Trick the compiler into thinking we're building from a continuous
    # integration tool so the build number is correctly shown in the title
    export CI=true
    export TRAVIS=true
    export TRAVIS_REPO_SLUG=yuzu-emu/yuzu-mainline
    export TRAVIS_TAG=$(git describe --tags)
    
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir -p build && cd build
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_QT_TRANSLATION=ON \
      -DYUZU_USE_BUNDLED_BOOST=ON \
      -DYUZU_USE_QT_WEB_ENGINE=ON \
      -DUSE_DISCORD_PRESENCE=ON
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
