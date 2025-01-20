# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
_pkgname=citron
pkgname=citron-git
pkgver=v0.3.canary.refresh.r11.gd7dc87b
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://citron-emu.org
license=(GPL-2.0-or-later)
provides=('citron')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-wayland' 'ffmpeg' 'sdl2' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb')
makedepends=('curl' 'git' 'boost' 'catch2' 'cmake' 'clang' 'fmt' 'doxygen' 'python-pip' 'glslang' 'libzip' 'lz4' 'mbedtls' 'ninja' 'nlohmann-json' 'zip' 'unzip' 'libzip')
conflicts=('citron')
options=(!debug lto)
source=(
  citron::git+https://git.citron-emu.org/Citron/Citron.git
  git+https://github.com/lsalzman/enet.git
  git+https://github.com/mozilla/cubeb.git
  git+https://github.com/yuzu-mirror/dynarmic.git
  git+https://github.com/libusb/libusb.git
  git+https://github.com/yuzu-mirror/discord-rpc.git
  git+https://github.com/KhronosGroup/Vulkan-Headers.git
  git+https://github.com/yuzu-mirror/sirit.git
  git+https://github.com/yuzu-mirror/mbedtls.git
  git+https://github.com/herumi/xbyak.git
  git+https://github.com/xiph/opus.git
  git+https://github.com/libsdl-org/SDL.git
  git+https://github.com/yhirose/cpp-httplib.git
  ffmpeg::git+https://github.com/FFmpeg/FFmpeg.git
  git+https://github.com/microsoft/vcpkg.git
  git+https://github.com/arun11299/cpp-jwt.git
  git+https://github.com/bylaws/libadrenotools.git
  git+https://github.com/lat9nq/tzdb_to_nx.git
  git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git
  git+https://github.com/yuzu-mirror/breakpad.git
  git+https://github.com/brofield/simpleini.git
  git+https://github.com/yuzu-mirror/oaknut
  git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
  git+https://github.com/google/googletest.git
  git+https://github.com/arsenm/sanitizers-cmake.git
  git+https://github.com/eggert/tz.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
)
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
  for submodule in {enet,cubeb,dynarmic,libusb,discord-rpc,Vulkan-Headers,sirit,mbedtls,xbyak,opus,SDL,cpp-httplib,ffmpeg,vcpkg,cpp-jwt,libadrenotools,tzdb_to_nx,VulkanMemoryAllocator,breakpad,simpleini,oaknut,Vulkan-Utility-Libraries};
  do
    git config --file=.gitmodules submodule.$submodule.url "${srcdir}"/$submodule
  done
  git -c protocol.file.allow=always submodule update --init

  pushd externals/cubeb
  for submodule in {sanitiers-cmake,googletest};
  do
    git config --file=.gitmodules submodule.$submodule.url "${srcdir}"/$submodule
  done
  git -c protocol.file.allow=always submodule update --init
  popd

  pushd externals/libadrenotools
  git config submodule.lib/linkersbypass.url "${srcdir}"/linkernsbypass
  git -c protocol.file.allow=always submodule update
  popd

  pushd externals/nx_tzdb/tzdb_to_nx
  git config submodule.externals/tz/tz.url "${srcdir}"/tz
  git -c protocol.file.allow=always submodule update
  popd
  
  pushd externals/sirit/externals
  git config submodule.externals/SPIRV-Headers.url "${srcdir}"/SPIRV-Headers
  git -c protocol.file.allow=always submodule update
  popd
}

build() {
  cd "$srcdir/$_pkgname"
  
  cmake -B build -GNinja \
    -DCITRON_USE_BUNDLED_VCPKG=ON \
    -DCITRON_USE_BUNDLED_QT=OFF \
    -DCITRON_USE_BUNDLED_FFMPEG=OFF \
    -DCITRON_TESTS=OFF \
    -DCITRON_USE_LLVM_DEMANGLE=OFF \
    -DCITRON_ENABLE_LTO=ON \
    -DCITRON_USE_QT_MULTIMEDIA=ON \
    -DCITRON_USE_QT_WEB_ENGINE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-march=x86-64-v2" \
    -DCMAKE_CXX_FLAGS="-march=x86-64-v2"
  ninja -C build
} 

package() {
  DESTDIR="$pkgdir/" ninja -C "$srcdir/$_pkgname"/build install

}
