# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
_pkgname=citron
pkgname=citron-git
pkgver=v0.6.1.canary.refresh.r40.g65dfe32
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://citron-emu.org
license=(GPL-2.0-or-later)
provides=('citron')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'ffmpeg' 'sdl2-compat' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus' 'boost')
makedepends=('curl' 'git' 'cmake' 'clang' 'llvm' 'doxygen' 'python-pip' 'glslang' 'ninja' 'zip' 'unzip' 'libzip' 'fmt' 'nlohmann-json' 'zlib' 'zstd')
conflicts=('citron')
options=(!debug)
source=(citron::git+https://git.citron-emu.org/citron/emu.git
        cubeb::git+https://github.com/mozilla/cubeb.git
        dynarmic::git+https://github.com/yuzu-mirror/dynarmic.git
        Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
        sirit::git+https://github.com/yuzu-mirror/sirit.git
        SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers
        mbedtls::git+https://github.com/yuzu-mirror/mbedtls.git
        xbyak::git+https://github.com/herumi/xbyak.git
        cpp-httplib::git+https://github.com/yhirose/cpp-httplib.git
        cpp-jwt::git+https://github.com/arun11299/cpp-jwt.git
        libadrenotools::git+https://github.com/bylaws/libadrenotools.git
        tzdb_to_nx::git+https://github.com/lat9nq/tzdb_to_nx.git
        VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git
        breakpad::git+https://github.com/yuzu-mirror/breakpad.git
        simpleini::git+https://github.com/brofield/simpleini.git
        oaknut::git+https://github.com/yuzu-mirror/oaknut.git
        Vulkan-Utility-Libraries::git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
        googletest::git+https://github.com/google/googletest.git
        sanitizers-cmake::git+https://github.com/arsenm/sanitizers-cmake.git
        zycore::git+https://github.com/zyantific/zycore-c.git
        linkernsbypass::git+https://github.com/bylaws/liblinkernsbypass.git
        tz::git+https://github.com/eggert/tz.git)

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
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  
  git rm -f externals/SDL
  git rm -f externals/ffmpeg/ffmpeg
  git rm -f externals/enet
  git rm -f externals/opus
  git rm -f externals/vcpkg
  git rm -f externals/libusb/libusb
  git rm -f externals/discord-rpc
  
  git submodule init
  for _submodule in cubeb dynarmic Vulkan-Headers sirit mbedtls xbyak cpp-httplib cpp-jwt libadrenotools tzdb_to_nx VulkanMemoryAllocator breakpad simpleini oaknut Vulkan-Utility-Libraries;
    do
      git config submodule.$_submodule.url "${srcdir}/$_submodule"
    done
  git -c protocol.file.allow=always submodule update --init

  pushd externals/cubeb
    git config submodule.cmake/sanitizers-cmake.url "${srcdir}"/sanitizers-cmake
    git config submodule.googletest.url "${srcdir}"/googletest
    git -c protocol.file.allow=always submodule update
  popd

  pushd externals/dynarmic/externals/zydis
    git config submodule.dependencies/zycore.url "${srcdir}"/zycore
    git -c protocol.file.allow=always submodule update
  popd

  pushd externals/libadrenotools
    git config submodule.lib/linkernsbypass.url "${srcdir}"/linkernsbypass
    git -c protocol.file.allow=always submodule update
  popd

  pushd externals/nx_tzdb/tzdb_to_nx
    git config submodule.externals/tz/tz.url "${srcdir}"/tz
    git -c protocol.file.allow=always submodule update
  popd
  
  pushd externals/sirit
    git config submodule.externals/SPIRV-Headers.url "${srcdir}"/SPIRV-Headers
    git -c protocol.file.allow=always submodule update
  popd
  
  #Replaces 'boost::asio::io_service' with 'boost::asio::io_context' for compatibility with Boost.ASIO versions 1.74.0 and later
  find src -type f -name '*.cpp' -exec sed -i 's/boost::asio::io_service/boost::asio::io_context/g' {} +
}

build() {
  cd "$srcdir/$_pkgname"
  
  cmake -B build -GNinja \
    -DCITRON_USE_BUNDLED_VCPKG=OFF \
    -DCITRON_USE_BUNDLED_QT=OFF \
    -DUSE_SYSTEM_QT=ON \
    -DCITRON_USE_BUNDLED_FFMPEG=OFF \
    -DCITRON_USE_BUNDLED_SDL2=OFF \
    -DCITRON_USE_EXTERNAL_SDL2=OFF \
    -DCITRON_TESTS=OFF \
    -DCITRON_CHECK_SUBMODULES=OFF \
    -DCITRON_USE_LLVM_DEMANGLE=OFF \
    -DCITRON_ENABLE_LTO=ON \
    -DCITRON_USE_QT_MULTIMEDIA=ON \
    -DCITRON_USE_QT_WEB_ENGINE=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DCITRON_USE_FASTER_LD=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="-march=native -mtune=native -Wno-error" \
    -DCMAKE_C_FLAGS="-march=native -mtune=native" \
    -DUSE_DISCORD_PRESENCE=OFF \
    -DBUNDLE_SPEEX=ON \
    -DCMAKE_SYSTEM_PROCESSOR=x86_64 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    
  ninja -C build
} 

package() {
  DESTDIR="$pkgdir/" ninja -C "$srcdir/$_pkgname"/build install

}
