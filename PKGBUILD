# Maintainer: Brendan Szymanski <hello@bscubed.dev>
# Co-Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

_pkgname=yuzu
pkgname=$_pkgname-mainline-git
pkgver=r23396.c1730f5d8
pkgrel=1
pkgdesc='An experimental open-source emulator for the Nintendo Switch (newest features)'
arch=('i686' 'x86_64')
url='https://github.com/yuzu-emu/yuzu-mainline'
license=('GPL2')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git' 'yuzu')
options=("!lto") #ThinLTO is already set
depends=('fmt'
         'cubeb'
         'mbedtls'
         'libinih'
         'qt6-multimedia'
         'qt6-webengine'
         'sdl2'
         'enet'
         'boost-libs')
makedepends=('boost'
             'llvm'
             'catch2'
             'clang'
             'cmake'
             'ffmpeg'
             'git'
             'ninja'
             'nlohmann-json'
             'qt6-tools'
             'robin-map')
optdepends=("qt6-wayland: Wayland support")
source=("$_pkgname::git+https://github.com/yuzu-emu/yuzu-mainline"
        'git+https://github.com/lsalzman/enet.git'
        'git+https://github.com/benhoyt/inih.git'
        'git+https://github.com/kinetiknz/cubeb.git'
        'git+https://github.com/MerryMage/dynarmic.git'
        'libressl::git+https://github.com/citra-emu/ext-libressl-portable.git'
        'git+https://github.com/libusb/libusb.git'
        'git+https://github.com/yuzu-emu/discord-rpc.git'
        'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
        'git+https://github.com/yuzu-emu/sirit'
        'git+https://github.com/yuzu-emu/mbedtls'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/xiph/opus.git'
        'git+https://git.ffmpeg.org/ffmpeg.git'
        'git+https://github.com/libsdl-org/SDL.git'
        'git+https://github.com/yhirose/cpp-httplib.git'
        'git+https://github.com/Microsoft/vcpkg.git'
        'git+https://github.com/arun11299/cpp-jwt.git'
        # cubeb dependencies
        'git+https://github.com/arsenm/sanitizers-cmake.git'
        'git+https://github.com/google/googletest'
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

    for submodule in {inih,cubeb,dynarmic,libressl,libusb,discord-rpc,Vulkan-Headers,sirit,mbedtls,xbyak,opus,ffmpeg,SDL,cpp-httplib,vcpkg,cpp-jwt,enet}; 
    do
        git config --file=.gitmodules submodule.$submodule.url "$srcdir/${submodule}"
    done

    git -c protocol.file.allow=always submodule update --init

    cd "$srcdir/$_pkgname"/externals/cubeb

    git config --file=.gitmodules submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
    git config --file=.gitmodules submodule.googletest.url "$srcdir/googletest"
    git -c protocol.file.allow=always submodule update --init
    
    cd "$srcdir/$_pkgname"/externals/sirit
    
    git config --file=.gitmodules submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
    git -c protocol.file.allow=always submodule update --init
}

build() {
    cd "$srcdir"
    
    [[ -d build ]] && rm -rf build

    cmake -S $_pkgname -B build \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_C_FLAGS="$CFLAGS -flto=thin" \
      -DCMAKE_CXX_FLAGS="$CXXFLAGS -flto=thin" \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
      -DYUZU_USE_QT_WEB_ENGINE=ON \
      -DYUZU_USE_QT_MULTIMEDIA=ON \
      -DENABLE_QT6=ON \
      -DYUZU_USE_EXTERNAL_SDL2=OFF \
      -DUSE_DISCORD_PRESENCE=ON \
      -DENABLE_QT_TRANSLATION=ON \
      -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
      -DBUILD_REPOSITORY=yuzu-emu/yuzu-mainline \
      -DBUILD_TAG=${pkgver} \
      -DTITLE_BAR_FORMAT_IDLE="yuzu | ${pkgver} {}" \
      -DTITLE_BAR_FORMAT_RUNNING="yuzu | ${pkgver} | {}" \
      -DYUZU_USE_BUNDLED_FFMPEG=OFF \
      -DYUZU_USE_BUNDLED_QT=OFF \
      -DYUZU_TESTS=OFF \
      -Wno-dev
    cmake --build build
}

package() {
    cd "$srcdir"
    DESTDIR="$pkgdir" cmake --install build
}
