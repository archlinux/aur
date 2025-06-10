# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=citron
pkgname=citron-git
pkgver=0.6.1.r62.g046538b
pkgrel=2
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://citron-emu.org
license=(GPL-2.0-or-later)
provides=('citron')
depends=('qt6-base' 'qt6-webengine' 'ffmpeg' 'sdl2-compat' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus' 'fmt' 'zydis' 'glibc' 'boost-libs' 'gcc-libs' 'lz4' 'openssl' 'zstd' 'libva' 'zlib')
makedepends=('git' 'cmake' 'glslang' 'ninja' 'doxygen' 'nlohmann-json' 'vulkan-headers' 'boost' 'qt6-tools' 'qt6-multimedia' 'rapidjson')
optdepends=('gamemode: Gamemoded support')
conflicts=('citron')
options=(!debug)
source=(citron::git+https://git.citron-emu.org/citron/emu.git
        cubeb::git+https://github.com/mozilla/cubeb.git
        dynarmic::git+https://github.com/yuzu-mirror/dynarmic.git
        discord-rpc::git+https://github.com/yuzu-mirror/discord-rpc.git
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
        'SKIP'
        'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/canary.refresh.//g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  
  git rm -f externals/SDL
  git rm -f externals/ffmpeg/ffmpeg
  git rm -f externals/enet
  git rm -f externals/opus
  git rm -f externals/vcpkg
  git rm -f externals/libusb/libusb
  
  git submodule init
  for _submodule in cubeb dynarmic discord-rpc Vulkan-Headers sirit mbedtls xbyak cpp-httplib cpp-jwt libadrenotools tzdb_to_nx VulkanMemoryAllocator breakpad simpleini oaknut Vulkan-Utility-Libraries;
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
  
  # Compatibility Boost 1.88
  find . -type f \( -name '*.cpp' -o -name '*.h' \) | xargs sed -i 's/\bboost::asio::io_service\b/boost::asio::io_context/g'
  find . -type f \( -name '*.cpp' -o -name '*.h' \) | xargs sed -i 's/\bboost::asio::io_service::strand\b/boost::asio::strand<boost::asio::io_context::executor_type>/g'
  find . -type f \( -name '*.cpp' -o -name '*.h' \) | xargs sed -i 's|#include *<boost/process/async_pipe.hpp>|#include <boost/process/v1/async_pipe.hpp>|g'
  find . -type f \( -name '*.cpp' -o -name '*.h' \) | xargs sed -i 's/\bboost::process::async_pipe\b/boost::process::v1::async_pipe/g'
}

build() {
  cd "$srcdir"
  
  cmake -B build -GNinja -S "$_pkgname" \
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
    -DUSE_DISCORD_PRESENCE=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
    -DTITLE_BAR_FORMAT_RUNNING="citron | ${pkgver} {}" \
    -DTITLE_BAR_FORMAT_IDLE="citron | ${pkgver} {}" \
    -DBUNDLE_SPEEX=ON \
    -DCMAKE_SYSTEM_PROCESSOR=x86_64 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    
  cmake --build build
} 

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir/" cmake --install build
  cd "$srcdir/$_pkgname/LICENSES"
  for file in *.txt;
  do
    install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
  done

  install -Dm644 "$srcdir/$_pkgname/dist/72-citron-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-citron-input.rules"

}
