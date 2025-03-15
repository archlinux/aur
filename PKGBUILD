# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
pkgname=citron
pkgver=0.6
pkgrel=3
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://citron-emu.org
license=(GPL-2.0-or-later)
provides=('citron')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'ffmpeg' 'sdl2' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb' 'enet' 'opus')
makedepends=('curl' 'git' 'cmake' 'clang' 'boost' 'python-pip' 'glslang' 'ninja' 'zip' 'unzip' 'libzip' 'fmt' 'nlohmann-json' 'zlib' 'zstd')
conflicts=('citron')
options=(!debug)
_tag="v${pkgver}-canary-refresh"
source=(${pkgname}::git+https://git.citron-emu.org/Citron/Citron.git#tag=${_tag}
        cubeb::git+https://github.com/mozilla/cubeb.git#commit=48689ae7a73caeb747953f9ed664dc71d2f918d8
        dynarmic::git+https://git.citron-emu.org/Citron/dynarmic.git#commit=ba8192d89078af51ae6f97c9352e3683612cdff1
        Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git#commit=cacef3039d277c448c89336290ec3937270b0996
        sirit::git+https://git.citron-emu.org/Citron/sirit.git#commit=ab75463999f4f3291976b079d42d52ee91eebf3f
        mbedtls::git+https://git.citron-emu.org/Citron/mbedtls.git#commit=8c88150ca139e06aa2aae8349df8292a88148ea1
        xbyak::git+https://github.com/herumi/xbyak.git#commit=a1ac3750f9a639b5a6c6d6c7da4259b8d6790989
        cpp-httplib::git+https://github.com/yhirose/cpp-httplib.git#commit=39a64fb4e7e42216f14f0ec51ccc5fa85e651432
        cpp-jwt::git+https://github.com/arun11299/cpp-jwt.git#commit=4a970bc302d671476122cbc6b43cc89fbf4a96ec
        libadrenotools::git+https://github.com/bylaws/libadrenotools.git#commit=8fae8ce254dfc1344527e05301e43f37dea2df80
        tzdb_to_nx::git+https://github.com/lat9nq/tzdb_to_nx.git#commit=97929690234f2b4add36b33657fe3fe09bd57dfd
        VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=c788c52156f3ef7bc7ab769cb03c110a53ac8fcb
        breakpad::git+https://git.citron-emu.org/Citron/breakpad.git#commit=c89f9dddc793f19910ef06c13e4fd240da4e7a59
        simpleini::git+https://github.com/brofield/simpleini.git#commit=6048871ea9ee0ec24be5bd099d161a10567d7dc2
        oaknut::git+https://git.citron-emu.org/Citron/oaknut.git#commit=94c726ce0338b054eb8cb5ea91de8fe6c19f4392
        Vulkan-Utility-Libraries::git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git#commit=bc3a4d9fd9b46729651a3cec4f5226f6272b8684
        googletest::git+https://github.com/google/googletest.git#commit=800f5422ac9d9e0ad59cd860a2ef3a679588acb4
        sanitizers-cmake::git+https://github.com/arsenm/sanitizers-cmake.git#commit=aab6948fa863bc1cbe5d0850bc46b9ef02ed4c1a
        zycore::git+https://github.com/zyantific/zycore-c.git#commit=0c372cdefe799e99812c008a0b74537bfa5fe077
        linkernsbypass::git+https://github.com/bylaws/liblinkernsbypass.git#commit=aa3975893d83ef1bc84c321ec60c65fbf1287887
        tz::git+https://github.com/eggert/tz.git#commit=16ce126a87c5f130cde8b8dce73b38952a19f085
        SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=c214f6f2d1a7253bb0e9f195c2dc5b0659dc99ef)

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

prepare() {
  cd "$srcdir/$pkgname"
  git rm -f externals/SDL
  git rm -f externals/ffmpeg/ffmpeg
  git rm -f externals/enet
  git rm -f externals/opus
  git rm -f externals/vcpkg
  git rm -f externals/libusb/libusb
  git rm -f externals/discord-rpc

  for _submodule in cubeb dynarmic Vulkan-Headers sirit mbedtls xbyak cpp-httplib cpp-jwt libadrenotools tzdb_to_nx VulkanMemoryAllocator breakpad simpleini oaknut Vulkan-Utility-Libraries;
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
  
  #Replaces 'boost::asio::io_service' with 'boost::asio::io_context' for compatibility with Boost.ASIO versions 1.74.0 and later
  find src -type f -name '*.cpp' -exec sed -i 's/boost::asio::io_service/boost::asio::io_context/g' {} +
}

build() {
  cd "$srcdir/$pkgname"
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
    -DUSE_DISCORD_PRESENCE=OFF \
    -DBUNDLE_SPEEX=ON \
    -DCITRON_USE_FASTER_LD=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="-march=native -mtune=native -Wno-error" \
    -DCMAKE_C_FLAGS="-march=native -mtune=native" \
    -DCMAKE_SYSTEM_PROCESSOR=x86_64 \
    -DCMAKE_BUILD_TYPE=Release
    
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C "$srcdir/$pkgname"/build install
}
