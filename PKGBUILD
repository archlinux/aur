# Maintainer: Charlotte <cemetery394@gmail.com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=citron-neo-git
pkgver=2026.04.27.r108.gee04d39
pkgrel=1
pkgdesc="Nintendo Switch emulator fork from citron-neo (git version)"
arch=('x86_64')
url="https://github.com/citron-neo/emulator"
license=('GPL-3.0-or-later')

depends=(
  'brotli' 'libgcc' 'lz4' 'glibc' 'zstd' 'sdl2' 'zlib' 'opus'
  'boost-libs' 'ffmpeg' 'libusb' 'openssl' 'speexdsp' 'libva'
  'hicolor-icon-theme' 'qt6-base' 'enet' 'openal' 'fmt'
  'libstdc++' 'qt6-webengine'
)

makedepends=(
  'git' 'cmake' 'ninja' 'python' 'boost' 'nlohmann-json'
  'qt6-tools' 'qt6-svg' 'qt6-multimedia' 'vulkan-headers'
  'clang' 'lld' 'rapidjson' 'gamemode'
)

optdepends=(
	'gamemode: gamemode support'
)

provides=('citron' 'citron-git' "${pkgname::-4}")
conflicts=('citron' 'citron-git' "${pkgname::-4}")

source=("git+https://github.com/citron-neo/emulator.git"
	"git+https://github.com/lsalzman/enet.git"
	"git+https://github.com/mozilla/cubeb.git"
	"git+https://github.com/xinitrcn1/dynarmic.git"
	"git+https://github.com/libusb/libusb.git"
	"git+https://github.com/yuzu-mirror/discord-rpc.git"
	"git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"git+https://github.com/yuzu-mirror/sirit.git"
	"git+https://github.com/yuzu-mirror/mbedtls.git"
	"git+https://github.com/herumi/xbyak.git"
	"git+https://github.com/xiph/opus.git"
	"git+https://github.com/libsdl-org/SDL.git"
	"git+https://github.com/yhirose/cpp-httplib.git"
	"ffmpeg::git+https://github.com/FFmpeg/FFmpeg.git"
	"git+https://github.com/microsoft/vcpkg.git"
	"git+https://github.com/arun11299/cpp-jwt.git"
	"git+https://github.com/bylaws/libadrenotools.git"
	"git+https://github.com/lat9nq/tzdb_to_nx.git"
	"git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"git+https://github.com/yuzu-mirror/breakpad.git"
	"git+https://github.com/brofield/simpleini.git"
	"git+https://github.com/yuzu-mirror/oaknut"
	"git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git"
	"git+https://github.com/KhronosGroup/SPIRV-Headers"
	"git+https://github.com/martinus/unordered_dense.git"
	#cubeb submodules
	"git+https://github.com/google/googletest.git"
	"git+https://github.com/arsenm/sanitizers-cmake.git"
	#dynarmic's submodules
	"git+https://github.com/lioncash/biscuit.git"
	"catch::git+https://github.com/catchorg/Catch2.git"
	"git+https://github.com/fmtlib/fmt.git"
	"oaknut-merryhime::git+https://github.com/merryhime/oaknut.git"
	#xbyak and unordered_dense are also dynarmic submodules
	#libadrenotools submodules
	"git+https://github.com/bylaws/liblinkernsbypass.git"
	#tzdb_to_nx submodules
	"git+https://github.com/eggert/tz.git"
	#sirit submodules includes SPIRV-Headers

	)
sha256sums=('SKIP'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd emulator
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd emulator
  git submodule init
  for _submodule in {enet,cubeb,dynarmic,libusb,discord-rpc,Vulkan-Headers,sirit,mbedtls,xbyak,opus,SDL,cpp-httplib,ffmpeg,vcpkg,cpp-jwt,libadrenotools,tzdb_to_nx,VulkanMemoryAllocator,breakpad,simpleini,oaknut,Vulkan-Utility-Libraries}
  do
	  git config submodule.${_submodule}.url "$srcdir/${_submodule}"
  done
  git config submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
  git config submodule.externals/unordered_dense.url "$srcdir/unordered_dense"
  git -c protocol.file.allow=always submodule update
  pushd externals/cubeb
  git submodule init
  git config submodule.googletest.url "$srcdir/googletest"
  git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
  git -c protocol.file.allow=always submodule update
  popd
  pushd externals/dynarmic
  git submodule init
  for _submodule in {biscuit,catch,fmt,xbyak}
  do
	  git config submodule.${_submodule}.url "$srcdir/${_submodule}"
  done
  git config submodule.oaknut.url "$srcdir/oaknut-merryhime"
  git config submodule.externals/unordered_dense.url "$srcdir/unordered_dense"
  git -c protocol.file.allow=always submodule update
  popd
  pushd externals/libadrenotools
  git submodule init
  git config submodule.lib/linkernsbypass.url "$srcdir/liblinkernsbypass"
  git -c protocol.file.allow=always submodule update
  popd
  pushd externals/nx_tzdb/tzdb_to_nx
  git submodule init
  git config submodule.externals/tz/tz.url "$srcdir/tz"
  git -c protocol.file.allow=always submodule update
  popd
  pushd externals/sirit
  git submodule init
  git config submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir"

  cmake -B build -S emulator -G Ninja \
    -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCITRON_USE_BUNDLED_FFMPEG=OFF \
    -DCITRON_USE_BUNDLED_QT=OFF \
    -DCITRON_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DCITRON_USE_EXTERNAL_SDL2=OFF \
    -DCITRON_USE_QT_MULTIMEDIA=ON \
    -DCITRON_USE_QT_WEB_ENGINE=ON \
    -DCITRON_DOWNLOAD_TIME_ZONE_DATA=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DUSE_DISCORD_PRESENCE=ON \
    -DCITRON_USE_FASTER_LD=OFF \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG -flto=thin" \
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG -flto=thin" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
    -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DTITLE_BAR_FORMAT_RUNNING="citron-neo | ${pkgver} {}" \
    -DTITLE_BAR_FORMAT_IDLE="citron-neo | ${pkgver} {}" \
    -DBUILD_ID="archlinux.org" \
    -DCITRON_TESTS=OFF \
    -DCITRON_USE_CPM=OFF \
    -DCITRON_SHADER_TOOL=OFF

  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/emulator/dist/72-citron-input.rules" "$pkgdir/usr/lib/udev/rules.d/72-citron-input.rules"
  sed -i 's/KERNEL==/ACTION!="remove", KERNEL==/' "$pkgdir/usr/lib/udev/rules.d/72-citron-input.rules"
  sed -i 's/Name=citron/Name=Citron-Neo/g' "$pkgdir/usr/share/applications/org.citron_emu.citron.desktop"

}
