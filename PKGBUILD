_pkgname=flycast
pkgname="$_pkgname"
pkgver=2.1
_tag="V$pkgver"
pkgrel=1
pkgdesc='A multi-platform Sega Dreamcast, Naomi and Atomiswave emulator'
arch=('x86_64' 'i686')
url="https://github.com/flyinghead/flycast"
license=('GPL2')
depends=(
  'alsa-lib'
  'hicolor-icon-theme'
  'libgl'
  'libzip'
)
makedepends=(
  'cmake'
  'git'
  'python'
  'systemd'
)
provides=("$_pkgname" reicast)
conflicts=("$_pkgname")
source=(
  "$_pkgname"::"git+$url.git#tag=$_tag"
  "SDL"::"git+https://github.com/libsdl-org/SDL"
  "Vulkan-Headers"::"git+https://github.com/KhronosGroup/Vulkan-Headers"
  "VulkanMemoryAllocator"::"git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator"
  "breakpad"::"git+https://github.com/flyinghead/mingw-breakpad"
  "glslang"::"git+https://github.com/KhronosGroup/glslang"
  "libchdr"::"git+https://github.com/rtissera/libchdr"
  "luabridge"::"git+https://github.com/vinniefalco/LuaBridge"
  "oboe"::"git+https://github.com/google/oboe"
)
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir/$_pkgname"

  _submodules=(
    'core/deps/SDL'
    'core/deps/Vulkan-Headers'
    'core/deps/VulkanMemoryAllocator'
    'core/deps/breakpad'
    'core/deps/glslang'
    'core/deps/libchdr'
    'core/deps/luabridge'
    'core/deps/oboe'
  )
  for submodule in ${_submodules[@]} ; do
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git -c protocol.file.allow=always submodule update ${submodule}
  done
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -B build -S "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make -C build
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="${pkgdir}" install
}
