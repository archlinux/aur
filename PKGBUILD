# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=citron
pkgver=0.9.0
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://citron-emu.org
license=(GPL-2.0-or-later)
depends=('qt6-base' 'qt6-webengine' 'fmt' 'boost-libs' 'ffmpeg' 'sdl2' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus' 'zydis' 'lz4' 'zlib' 'glibc' 'libva' 'zstd' 'gcc-libs' 'openssl' 'openal'
	 'speexdsp')
makedepends=('git' 'cmake' 'boost' 'glslang' 'ninja' 'nlohmann-json' 'rapidjson' 'qt6-multimedia' 'qt6-tools' 'gamemode' 'doxygen' 'vulkan-headers' 'vulkan-utility-libraries')
optdepends=('gamemode: Gamemoded support')
options=(!debug)
source=(${pkgname}::git+https://git.citron-emu.org/citron/emulator.git#tag=${pkgver}
        cubeb::git+https://github.com/mozilla/cubeb.git
        discord-rpc::git+https://github.com/yuzu-mirror/discord-rpc.git
        dynarmic::git+https://github.com/yuzu-mirror/dynarmic.git
        Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git
        sirit::git+https://github.com/yuzu-mirror/sirit.git
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
        tz::git+https://github.com/eggert/tz.git
	SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git
)
b2sums=('67b8a61fe87f2205827fefd655b7f7af14902aa1c41fc26953c80d3b1f35f6319091ca666213c352b314374215b2a001d4bc5b5ea81f478367a101c845c2b668'
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

prepare() {
  cd "$srcdir/$pkgname"
  git rm -f externals/SDL
  git rm -f externals/ffmpeg/ffmpeg
  git rm -f externals/enet
  git rm -f externals/opus
  git rm -f externals/vcpkg
  git rm -f externals/libusb/libusb

  for _submodule in cubeb discord-rpc dynarmic Vulkan-Headers sirit mbedtls xbyak cpp-httplib cpp-jwt libadrenotools tzdb_to_nx VulkanMemoryAllocator breakpad simpleini oaknut Vulkan-Utility-Libraries;
    do
      git config submodule.$_submodule.url "${srcdir}/$_submodule"
    done
  git -c protocol.file.allow=always submodule update

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

  # Compatibilité Boost 1.88
  find . -type f \( -name '*.cpp' -o -name '*.h' \) | xargs sed -i 's/\bboost::asio::io_service\b/boost::asio::io_context/g'
  find . -type f \( -name '*.cpp' -o -name '*.h' \) | xargs sed -i 's/\bboost::asio::io_service::strand\b/boost::asio::strand<boost::asio::io_context::executor_type>/g'
  find . -type f \( -name '*.cpp' -o -name '*.h' \) | xargs sed -i 's|#include *<boost/process/async_pipe.hpp>|#include <boost/process/v1/async_pipe.hpp>|g'
  find . -type f \( -name '*.cpp' -o -name '*.h' \) | xargs sed -i 's/\bboost::process::async_pipe\b/boost::process::v1::async_pipe/g'

  # Ensure cubeb is used from externals
  sed -i '377d;378d;379d' CMakeLists.txt

  # Fix QT for 6.10.0
  sed -i 's/find_package(Qt6 REQUIRED COMPONENTS Widgets/find_package(Qt6 REQUIRED COMPONENTS Widgets GuiPrivate/g;s/set(CITRON_QT_COMPONENTS2 Core/set(CITRON_QT_COMPONENENTS2 Core GuiPrivate/g' CMakeLists.txt
  sed -i 's/target_link_libraries(citron PRIVATE Boost\:\:headers/target_link_libraries(citron PRIVATE Boost\:\:headers Qt6\:\:GuiPrivate/g' src/citron/CMakeLists.txt
}

build() {
  cd "$srcdir"
  # Forcing GCC since clang currently fails to compile citron
  case $LTOFLAGS in
	  *thin*)
		  export CFLAGS="${CFLAGS//thin/auto}"
		  export CXXFLAGS="${CXXFLAGS//thin/auto}"
		  export LDFLAGS="${LDFLAGS//thin/auto}"
		  echo "YOU GOT THIN"
	  ;;
  esac
  case $LDFLAGS in
	  *lld*)
		  export LDFLAGS="${LDFLAGS//lld/bfd}"
		  echo "YOU GOT LLD"
		  ;;
  esac
  echo $CFLAGS
  echo $CXXFLAGS
  echo $LDFLAGS
  cmake -B build -GNinja -S "$pkgname" \
    -DCITRON_USE_BUNDLED_VCPKG=OFF \
    -DCITRON_USE_BUNDLED_QT=OFF \
    -DCITRON_USE_BUNDLED_FFMPEG=OFF \
    -DCITRON_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DCITRON_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
    -DCITRON_USE_BUNDLED_SDL2=OFF \
    -DCITRON_USE_EXTERNAL_SDL2=OFF \
    -DCITRON_TESTS=OFF \
    -DCITRON_CHECK_SUBMODULES=OFF \
    -DCITRON_ENABLE_LTO=ON \
    -DCITRON_USE_QT_MULTIMEDIA=ON \
    -DCITRON_USE_QT_WEB_ENGINE=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DUSE_DISCORD_PRESENCE=ON \
    -DCITRON_USE_FASTER_LD=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
    -DTITLE_BAR_FORMAT_RUNNING="citron | ${pkgver} {}" \
    -DTITLE_BAR_FORMAT_IDLE="citron | ${pkgver} {}" \
    -DCMAKE_SYSTEM_PROCESSOR=$CARCH \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"

    cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir/" cmake --install build
  cd "$srcdir/$pkgname/LICENSES"
  for file in *.txt;
  do
    install -Dm644 $file "$pkgdir/usr/share/licenses/$pkgname/$file"
  done
  install -Dm644 "$srcdir/$pkgname/dist/72-citron-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-citron-input.rules"
  # Fix udev rules for systemd 258
  sed -i 's/KERNEL==/ACTION!="remove", KERNEL==/' "$pkgdir/usr/lib/udev/rules.d/72-citron-input.rules"
}
