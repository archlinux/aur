# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Co-Maintainer: Brendan Szymanski <hello@bscubed.dev>
_pkgname=yuzu
pkgname=$_pkgname-mainline-git
pkgver=1492.r0.gf32ca0b
pkgrel=1
pkgdesc='An experimental open-source emulator for the Nintendo Switch (newest features)'
arch=('i686' 'x86_64')
url='https://github.com/yuzu-emu/yuzu-mainline'
license=('GPL2')
provides=('yuzu' 'yuzu-cmd')
conflicts=('yuzu-git' 'yuzu-canary-git' 'yuzu')
_debug=false # set to true to debug yuzu. Whenever debugging with gdb, remember to enter `handle SIGSEGV nostop` before `run`, as yuzu uses SIGSEGV for memory access!!!!!!!!`
if [ "$_debug" = false ]
then
    options=("lto" "strip")
    _cmake_build_type=Release
    _yuzu_lto=ON
else
    options=("!lto" "!strip" "debug")
    _cmake_build_type=Debug
    _yuzu_lto=OFF
fi



depends=('fmt'
         'cubeb'
         'mbedtls'
         'libinih'
         'qt5-multimedia'
         'qt5-webengine'
         'sdl2'
         'enet'
         'boost-libs')
makedepends=('boost'
             'llvm'
             'catch2'
             'gcc'
             'cmake'
             'ffmpeg'
             'git'
             'ninja'
             'nlohmann-json'
             'qt5-tools'
             'robin-map'
             'vulkan-headers'
             'rapidjson')
optdepends=("qt5-wayland: Wayland support")
source=("$_pkgname::git+https://github.com/yuzu-emu/yuzu-mainline"
        'git+https://github.com/lsalzman/enet.git'
        'git+https://github.com/benhoyt/inih.git'
        'git+https://github.com/mozilla/cubeb.git'
        'git+https://github.com/MerryMage/dynarmic.git'
        'git+https://github.com/libusb/libusb.git'
        'git+https://github.com/yuzu-emu/discord-rpc.git'
        'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
        'git+https://github.com/yuzu-emu/sirit'
        'git+https://github.com/yuzu-emu/mbedtls.git'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/xiph/opus.git'
        'git+https://git.ffmpeg.org/ffmpeg.git'
        'git+https://github.com/libsdl-org/SDL.git'
        'git+https://github.com/yhirose/cpp-httplib.git'
        'git+https://github.com/Microsoft/vcpkg.git'
        'git+https://github.com/arun11299/cpp-jwt.git'
        'git+https://github.com/bylaws/libadrenotools.git'
        'git+https://github.com/lat9nq/tzdb_to_nx.git'
        'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
        # cubeb dependencies
        'git+https://github.com/arsenm/sanitizers-cmake.git'
        'git+https://github.com/google/googletest'
        # sirit dependencies
        'git+https://github.com/KhronosGroup/SPIRV-Headers.git'
        # libadrenotools' dependencies
        'git+https://github.com/bylaws/liblinkernsbypass.git'
        # tzdb_to_nx submodules
        'git+https://github.com/eggert/tz.git')
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
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    #echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    git describe --long --tags --abbrev=7 | sed 's/^mainline-//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 3- # Thanks to tleydxdy for this
}

prepare() {
    cd "$srcdir/$_pkgname"

    for submodule in {inih,cubeb,dynarmic,libusb,discord-rpc,Vulkan-Headers,sirit,mbedtls,xbyak,opus,ffmpeg,SDL,cpp-httplib,vcpkg,cpp-jwt,enet,libadrenotools,tzdb_to_nx,VulkanMemoryAllocator}; 
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

    cd "$srcdir/$_pkgname/externals/libadrenotools"
    git config --file=.gitmodules submodule.lib/linkernsbypass.url "$srcdir/liblinkernsbypass"
    git -c protocol.file.allow=always submodule update --init

    cd "$srcdir/$_pkgname/externals/nx_tzdb/tzdb_to_nx/"
    git config --file=.gitmodules submodule.externals/tz/tz.url "$srcdir/tz"
    git -c protocol.file.allow=always submodule update --init
}

build() {
    cd "$srcdir"
    
    #[[ -d build ]] && rm -rf build

    cmake -S $_pkgname -B build \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_C_COMPILER=gcc \
      -DCMAKE_CXX_COMPILER=g++ \
      -DCMAKE_C_FLAGS="$CFLAGS" \
      -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
      -DCMAKE_BUILD_TYPE=$_cmake_build_type \
      -DYUZU_USE_QT_WEB_ENGINE=ON \
      -DYUZU_USE_QT_MULTIMEDIA=ON \
      -DYUZU_ENABLE_LTO=$_yuzu_lto \
      -DYUZU_USE_EXTERNAL_SDL2=OFF \
      -DYUZU_USE_BUNDLED_FFMPEG=OFF \
      -DYUZU_USE_BUNDLED_QT=OFF \
      -DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
      -DYUZU_DOWNLOAD_TIME_ZONE_DATA=ON \
      -DYUZU_TESTS=OFF \
      -DENABLE_QT6=OFF \
      -DUSE_DISCORD_PRESENCE=ON \
      -DENABLE_QT_TRANSLATION=ON \
      -DBUILD_REPOSITORY=yuzu-emu/yuzu-mainline \
      -DBUILD_TAG=${pkgver} \
      -DTITLE_BAR_FORMAT_IDLE="yuzu | ${pkgver} {}" \
      -DTITLE_BAR_FORMAT_RUNNING="yuzu | ${pkgver} | {}" \
      -Wno-dev
    cmake --build build
}

package() {
    cd "$srcdir"
    DESTDIR="$pkgdir" cmake --install build
}
